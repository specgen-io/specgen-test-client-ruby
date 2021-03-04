require "date"
require "test_service_client/type"
require "test_service_client/enum"
require "test_service_client/dataclass"

module TestService
  class Message
    include DataClass
    val :int_field, Integer
    val :string_field, String
    def initialize(int_field:, string_field:)
      super method(__method__).parameters.map { |parts| [parts[1], eval(parts[1].to_s)] }.to_h
    end
    
  end
  
  class Nested
    include DataClass
    val :field, String
    def initialize(field:)
      super method(__method__).parameters.map { |parts| [parts[1], eval(parts[1].to_s)] }.to_h
    end
    
  end
  
  class Parent
    include DataClass
    val :field, String
    val :nested, Nested
    def initialize(field:, nested:)
      super method(__method__).parameters.map { |parts| [parts[1], eval(parts[1].to_s)] }.to_h
    end
    
  end
  
  class Choice
    include Enum
    define :first_choice, 'FIRST_CHOICE'
    define :second_choice, 'SECOND_CHOICE'
    define :third_choice, 'THIRD_CHOICE'
  end
  
  class EnumFields
    include DataClass
    val :enum_field, Choice
    def initialize(enum_field:)
      super method(__method__).parameters.map { |parts| [parts[1], eval(parts[1].to_s)] }.to_h
    end
    
  end
  
  class NumericFields
    include DataClass
    val :int_field, Integer
    val :long_field, Integer
    val :float_field, Float
    val :double_field, Float
    val :decimal_field, Float
    def initialize(int_field:, long_field:, float_field:, double_field:, decimal_field:)
      super method(__method__).parameters.map { |parts| [parts[1], eval(parts[1].to_s)] }.to_h
    end
    
  end
  
  class NonNumericFields
    include DataClass
    val :boolean_field, Boolean
    val :string_field, String
    val :uuid_field, UUID
    val :date_field, Date
    val :datetime_field, DateTime
    def initialize(boolean_field:, string_field:, uuid_field:, date_field:, datetime_field:)
      super method(__method__).parameters.map { |parts| [parts[1], eval(parts[1].to_s)] }.to_h
    end
    
  end
  
  class ArrayFields
    include DataClass
    val :int_array_field, T.array(Integer)
    val :string_array_field, T.array(String)
    def initialize(int_array_field:, string_array_field:)
      super method(__method__).parameters.map { |parts| [parts[1], eval(parts[1].to_s)] }.to_h
    end
    
  end
  
  class MapFields
    include DataClass
    val :int_map_field, T.hash(String, Integer)
    val :string_map_field, T.hash(String, String)
    def initialize(int_map_field:, string_map_field:)
      super method(__method__).parameters.map { |parts| [parts[1], eval(parts[1].to_s)] }.to_h
    end
    
  end
  
  class OptionalFields
    include DataClass
    val :int_option_field, T.nilable(Integer)
    val :string_option_field, T.nilable(String)
    def initialize(int_option_field:, string_option_field:)
      super method(__method__).parameters.map { |parts| [parts[1], eval(parts[1].to_s)] }.to_h
    end
    
  end
  
  class RawJsonField
    include DataClass
    val :json_field, T.hash(String, Untyped)
    def initialize(json_field:)
      super method(__method__).parameters.map { |parts| [parts[1], eval(parts[1].to_s)] }.to_h
    end
    
  end
  
  class OrderCreated
    include DataClass
    val :id, UUID
    val :sku, String
    val :quantity, Integer
    def initialize(id:, sku:, quantity:)
      super method(__method__).parameters.map { |parts| [parts[1], eval(parts[1].to_s)] }.to_h
    end
    
  end
  
  class OrderChanged
    include DataClass
    val :id, UUID
    val :quantity, Integer
    def initialize(id:, quantity:)
      super method(__method__).parameters.map { |parts| [parts[1], eval(parts[1].to_s)] }.to_h
    end
    
  end
  
  class OrderCanceled
    include DataClass
    val :id, UUID
    def initialize(id:)
      super method(__method__).parameters.map { |parts| [parts[1], eval(parts[1].to_s)] }.to_h
    end
    
  end
  
  OrderEvent = T.union(created: OrderCreated, changed: OrderChanged, canceled: OrderCanceled)
end

