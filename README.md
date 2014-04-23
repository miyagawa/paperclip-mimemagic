# Paperclip::Mimemagic

Monkeypatch to use Mimemagic gem instead of `file` command to guess a MIME type of files.

## Installation

Add this line to your application's Gemfile:

    gem 'paperclip-mimemagic'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paperclip-mimemagic

## Usage

Load this gem in your Rails initializer:

```
require 'paperclip/mimemagic'
Paperclip::Mimemagic.patch if `which file` == ""
```

and both Paperclip::ContentTypeDetector and Paperclip::MediaTypeSpoofDetector will be monkeypatched.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/paperclip-mimemagic/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
