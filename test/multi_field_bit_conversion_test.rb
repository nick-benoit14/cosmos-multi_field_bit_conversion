require_relative 'test_helper'
require 'cosmos'
require 'test/unit'
require 'pry'

module Cosmos
#module MultiFieldBitConversion
class TestMultiFieldBitConversion < Test::Unit::TestCase
    def self.build_agg_packet
      packet = System.telemetry.packet('PI', 'TEST_3')


      packet.write('TST_PK_ID', 150)
      packet.write('VALUE_A', 100)
      packet.write('VALUE_B', -10)

      packet.write('VALUE_C', 140) #8c
      packet.write('VALUE_D', 7) #7
      packet
    end

    def test_uint
      packet = self.class.build_agg_packet
      conversion = MultiFieldBitConversion.new('VALUE_C', 'VALUE_D')
      result = conversion.call(nil, packet, [])
      assert_equal result, 2247 # 8c7
      assert_equal conversion.converted_type, :UINT
      assert_equal conversion.converted_bit_size, 20
    end

    def test_int
      packet = self.class.build_agg_packet
      conversion = MultiFieldBitConversion.new('VALUE_B', 'VALUE_A')
      result = conversion.call(nil, packet, [])
      assert_equal result, -2460 
      assert_equal conversion.converted_type, :INT
      assert_equal conversion.converted_bit_size, 16
    end
end
#end
end
