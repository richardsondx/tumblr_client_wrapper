require "tumblr_client_wrapper/version"

module TumblrClientWrapper
  require 'tumblr_client_wrapper/helpers'
  require 'tumblr_client_wrapper/railtie' if defined?(Rails)
  autoload :VERSION, File.join(File.dirname(__FILE__), 'tumblr_wrapper/version')
end
