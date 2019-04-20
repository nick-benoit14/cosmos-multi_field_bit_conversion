# Cosmos::MultiFieldBitConversion

A cosmos read conversion designed to combine the bits of several uint fields. Where values on the left are more significant, and values on the right are less significant. This conversaion will work with any number of uint fields, of any size.

## Installation

Add this line to your application's Gemfile:

    gem 'cosmos-multi_field_bit_conversion'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cosmos-multi_field_bit_conversion

## Usage

In your telemetry definition file: `config/targets/my-target/cmd_tlm/test.txt`
```
TELEMETRY PI TEST LITTLE_ENDIAN "Test Aggregate Packet"
    APPEND_ID_ITEM TST_PK_ID 16 UINT 149 "Packet ID which must be 149"
    APPEND_ITEM    VALUE_A    8   UINT
    APPEND_ITEM    VALUE_B    8   UINT

    ITEM  HEAD_LENGTH  32  16  UINT

    APPEND_ITEM    VALUE_C    8   UINT
    APPEND_ITEM    VALUE_D    8   UINT
    ITEM BOTH_FIELDS 0 0 DERIVED "Description"
      READ_CONVERSION cosmos/multi_field_bit_conversion.rb VALUE_C VALUE_D 

    ## Both fields is essentially (VALUE_C << 8 | VALUE_D) 


```

In your target definition file `config/targets/my-target/target.txt`
```
REQUIRE cosmos/multi_field_bit_conversion.rb
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
