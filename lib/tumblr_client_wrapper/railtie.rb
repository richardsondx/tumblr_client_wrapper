require 'tumblr_client_wrapper/helpers'

module TumblrClientWrapper
  class Railtie < Rails::Railtie
    initializer "tumblr_client_wrapper.helpers" do
      ActionView::Base.send :include, Helpers
    end
  end
end