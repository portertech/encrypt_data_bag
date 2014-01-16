[![Build Status](https://secure.travis-ci.org/portertech/encrypt_data_bag.png)](https://travis-ci.org/portertech/encrypt_data_bag)

## Installation

```
$ gem install encrypt_data_bag
```

## Usage

```
$ encrypt_data_bag -h
Usage: encrypt_data_bag [options]
    -h, --help                       Display this message
    -v, --version                    Display version
    -s, --secret-file FILE           Secret key FILE
    -i, --input-file FILE            Input FILE (plain-text data bag item)
    -o, --output-file FILE           Output FILE (encrypted data bag item)

$ encrypt_data_bag -s ~/.chef/encrypted_data_bag_secret -i plain_text_item.rb -o encrypted_item.json
```

## Contributing

1. Fork it ( http://github.com/portertech/encrypt_data_bag/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
