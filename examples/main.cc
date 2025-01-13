// Based on seastar/demos/http_client_demo.cc
//
// Copyright 2022 ScyllaDB Ltd.
// SPDX-License-Identifier: Apache-2.0

#include <seastar/core/app-template.hh>
#include <seastar/core/coroutine.hh>
#include <seastar/http/client.hh>
#include <seastar/http/request.hh>
#include <seastar/net/dns.hh>

using namespace seastar; // NOLINT

namespace bpo = boost::program_options;

struct printer {
  future<consumption_result<char>> operator()(temporary_buffer<char> buf) {
    if (buf.empty()) {
      return make_ready_future<consumption_result<char>>(
          stop_consuming(std::move(buf)));
    }
    fmt::print("{}", sstring(buf.get(), buf.size()));
    return make_ready_future<consumption_result<char>>(continue_consuming());
  }
};

future<> run_app(const bpo::variables_map &config) {
  auto host = config["host"].as<std::string>();
  auto port = config["port"].as<uint16_t>();
  auto path = config["path"].as<std::string>();
  auto method = config["method"].as<std::string>();

  net::hostent e = co_await net::dns::get_host_by_name(
      host, net::inet_address::family::INET);

  auto addr = socket_address(e.addr_list.front(), port);
  auto certs = make_shared<tls::certificate_credentials>();
  co_await certs->set_system_trust();

  http::experimental::client client(addr, certs, host);

  auto req = http::request::make(method, host, path);

  co_await client.make_request(
      std::move(req), [](const http::reply &rep, input_stream<char> in) {
        fmt::print("Reply status {}\n--------8<--------\n", rep._status);
        return in.consume(printer{}).then(
            [in = std::move(in)] mutable { return in.close(); });
      });
}

int main(int ac, char **av) {
  app_template app;
  app.add_options() // flags
      ("port", bpo::value<uint16_t>()->default_value(443),
       "Port to connect") // port
      ("host", bpo::value<std::string>()->default_value("google.com"),
       "Host to connect") // host
      ("path", bpo::value<std::string>()->default_value("/"),
       "Path to query upon") // path
      ("method", bpo::value<std::string>()->default_value("GET"),
       "HTTP method");

  return app.run(ac, av, [&] { return run_app(app.configuration()); });
}
