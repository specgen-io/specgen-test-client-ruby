require "test/unit/runner/junitxml"

require "test_service_client"

module Http
  class StringParamsTests < Test::Unit::TestCase
    def test_url_params_set
      params = StringParams.new
      params['some_param'] = 123
      params['another_param'] = 'bla-bla'
      actual = params.set_to_url("http://service.com/{some_param}/{another_param}")
      assert_equal "http://service.com/123/bla-bla", actual
    end
  end
end