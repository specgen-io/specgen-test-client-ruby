require "date"
require "emery"

module TestService
  class Message
    include DataClass
    val :int_field, Integer
    val :string_field, String
    def initialize(int_field:, string_field:)
      super method(__method__).parameters.map { |parts| [parts[1], eval(parts[1].to_s)] }.to_h
    end
    
  end
  
  class Choice
    include Enum
    define :first_choice, 'FIRST_CHOICE'
    define :second_choice, 'SECOND_CHOICE'
    define :third_choice, 'THIRD_CHOICE'
  end
end

module TestService::V2
  class Message
    include DataClass
    val :bool_field, Boolean
    val :string_field, String
    def initialize(bool_field:, string_field:)
      super method(__method__).parameters.map { |parts| [parts[1], eval(parts[1].to_s)] }.to_h
    end
    
  end
end

