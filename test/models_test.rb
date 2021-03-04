require "test/unit/runner/junitxml"

require 'test_service_client/jsoner'
require 'test_service_client/tod'
require 'test_service_client/models'

module TestService
  class ModelsTests < Test::Unit::TestCase
    def check_serialization(type, data, json)
      actual_json = Jsoner.to_json(type, data)
      assert_equal json, actual_json
      actual_data = Jsoner.from_json(type, json)
      assert_equal data, actual_data
    end

    def test_numeric
      data = NumericFields.new(
          int_field: 0,
          long_field: 0,
          float_field: 1.23,
          double_field: 1.23,
          decimal_field: 1.23,
      )
      json = '{"int_field":0,"long_field":0,"float_field":1.23,"double_field":1.23,"decimal_field":1.23}'
      check_serialization(NumericFields, data, json)
    end

    def test_non_numeric
      data = NonNumericFields.new(
          boolean_field: true,
          string_field: "the string",
          uuid_field: "123e4567-e89b-12d3-a456-426655440000",
          date_field: Date.new(2019, 11, 30),
          datetime_field: DateTime.new(2019, 11, 30, 17, 45, 55),
          )
      json = '{"boolean_field":true,"string_field":"the string","uuid_field":"123e4567-e89b-12d3-a456-426655440000","date_field":"2019-11-30","datetime_field":"2019-11-30T17:45:55"}'
      check_serialization(NonNumericFields, data, json)
    end

    def test_array
      data = ArrayFields.new(
          int_array_field: [1, 2, 3],
          string_array_field: ["one", "two", "three"],
          )
      json = '{"int_array_field":[1,2,3],"string_array_field":["one","two","three"]}'
      check_serialization(ArrayFields, data, json)
    end

    def test_map
      data = MapFields.new(
          int_map_field: {"one" => 1, "two" => 2},
          string_map_field: {"one" => "first", "two" => "second"},
          )
      json = '{"int_map_field":{"one":1,"two":2},"string_map_field":{"one":"first","two":"second"}}'
      check_serialization(MapFields, data, json)
    end

    def test_optional
      data = OptionalFields.new(
          int_option_field: 123,
          string_option_field: "the string",
          )
      json = '{"int_option_field":123,"string_option_field":"the string"}'
      check_serialization(OptionalFields, data, json)
    end

    def test_optional_nil
      data = OptionalFields.new(
          int_option_field: nil,
          string_option_field: nil,
          )
      json = '{"int_option_field":null,"string_option_field":null}'
      check_serialization(OptionalFields, data, json)
    end

    def test_enum
      data = EnumFields.new(enum_field: Choice::second_choice)
      json = '{"enum_field":"SECOND_CHOICE"}'
      check_serialization(EnumFields, data, json)
    end

    def test_json
      data = RawJsonField.new(
          json_field: {
              "the_array" => [1, "some string"],
              "the_object" => {"the_bool" => true, "the_string" => "some value"},
              "the_scalar" => 123,
          },
      )
      json = '{"json_field":{"the_array":[1,"some string"],"the_object":{"the_bool":true,"the_string":"some value"},"the_scalar":123}}'
      check_serialization(RawJsonField, data, json)
    end

    def test_oneof
      data = OrderChanged.new(id: "58d5e212-165b-4ca0-909b-c86b9cee0111", quantity: 3)
      json = '{"changed":{"id":"58d5e212-165b-4ca0-909b-c86b9cee0111","quantity":3}}'
      check_serialization(OrderEvent, data, json)
    end
  end
end