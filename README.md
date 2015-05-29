status: Not Ready! I am stil writting this gem

[![Build Status](https://travis-ci.org/richardsondx/tumblr_client_wrapper.svg?branch=master)](https://travis-ci.org/richardsondx/tumblr_client_wrapper) 

# The Tumblr Client

This gem allows you to easily embed tumblr posts ( Text, Photo, Quote, Link, Chat Audio, Video, Answer) with predefined or custom style.

This Tumblr gem is a Ruby Wrapper for the Tumblr-client official gem and Tumblr v2 API. 

## Installation

Add these lines to your application's Gemfile:

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

To get your consumer key [register your application](register an application)

Use the [console](https://api.tumblr.com/console) to get your oauth_token and oauth_token_secret


## Usage

e.g: blogid.tumblr.com

In your view: add the following to Add *All Posts* from your blog
<%= embed_tumblr("blogid") %>

You can also specify an options. Such as requesting the gem to only display posts that are photos, quotes or text
by passing an option :type followed with the type of post you'd like to dislay.

<%= embed_tumblr("blogid", {type: "quotes"})  %>

Tumblr has 8 differents type of posts: Text, Photo, Quote, Link, Chat, Audio, Video, Answer

valid *options* you can pass are:
		  :params,
          :id,
          :tag,
          :limit,
          :offset,
          :reblog_info,
          :type,
          :notes_info,
          :filter

<%= embed_tumblr("blogid", {type: :quote, limit: 20})  %>

## Style

To use the default style of the gem add the following line to application.css
    *= require tumblr_client_wrapper.css

You can edit the style of the posts by updating the following CSS classes

.post_content{}
.post_content .post_title{}
.post_content .post_title blockquote{}
.post_content .extra_large{}
.post_body{}
.post_body p{}
.post_body p.source {}

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

1. Fix Options
2. Add embed for 'answers'

## Copyright

The Tumblr Client gem is Copyright (c) 2015 - 2020 Richardson Dackam and is licensed under the MIT License.
Tumblr is Copyright (c) Tumblr, Inc. The Tumblr gem is NOT affiliated with Tumblr, Inc.