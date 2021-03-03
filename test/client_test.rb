require 'test/unit/runner/junitxml'

require 'test_service_client/models'
require 'test_service_client/client'

module TestService
  class ClientTests < Test::Unit::TestCase
    def test_echo_body
      request_body = Message.new(int_field: 123, string_field: "the string")
      client = EchoClient.new(URI(ENV["SERVICE_URL"]))
      response_body = client.echo_body(body: request_body)
      assert_true T.instance_of?(Message, response_body)
      assert_equal request_body, response_body
    end

    def test_echo_query_parameters
      client = EchoClient.new(URI(ENV["SERVICE_URL"]))
      response_body = client.echo_query(int_query: 123, string_query: "the string")
      assert_true T.instance_of?(Message, response_body)
      assert_equal Message.new(int_field: 123, string_field: "the string"), response_body
    end

    def test_echo_header
      client = EchoClient.new(URI(ENV["SERVICE_URL"]))
      response_body = client.echo_header(int_header: 123, string_header: "the string")
      assert_true T.instance_of?(Message, response_body)
      assert_equal Message.new(int_field: 123, string_field: "the string"), response_body
    end

    def test_echo_url_params
      client = EchoClient.new(URI(ENV["SERVICE_URL"]))
      response_body = client.echo_url_params(int_url: 123, string_url: "value")
      assert_true T.instance_of?(Message, response_body)
      assert_equal Message.new(int_field: 123, string_field: "value"), response_body
    end
  end
end