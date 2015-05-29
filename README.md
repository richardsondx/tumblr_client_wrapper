status: Not Ready! I am stil writting this gem

[![Build Status](https://travis-ci.org/richardsondx/tumblr_client_wrapper.svg?branch=master)](https://travis-ci.org/richardsondx/tumblr_client_wrapper) 

# The Tumblr Client

The  Tumblr client Wrapper is a Ruby Wrapper for the Tumblr-client official gem and Tumblr v2 API. 
This gem allows you to easily embed tumblr posts ( Text, Photo, Quote, Link, Chat Audio, Video, Answer) with predefined or custom style.

## Installation

Add this line to your application's Gemfile:

    gem 'tumblr-client-wrapper'
    gem 'tumblr-client'


## What You Need

Get an OAuth key on the Tumblr websie by registering your  application

## Configuration

Tumblr Client Wrapper uses Tumblr-Client configuration.

Tumblr.configure do |config|
  config.consumer_key = "consumer_key"
  config.consumer_secret = "consumer_secret"
  config.oauth_token = "access_token"
  config.oauth_token_secret = "access_token_secret"
end

## Usage



## Requirement

Ruby 1.9.x or 2.x.x

## Contributing

No request is too small and I encourage everyone to get involved.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## TODO

1. Add setup for 'answers'

## Copyright

The Tumblr Client gem is Copyright (c) 2015 - 2020 Richardson Dackam and is licensed under the MIT License.
Tumblr is Copyright (c) Tumblr, Inc. The Tumblr gem is NOT affiliated with Tumblr, Inc.