require 'tumblr_client_wrapper/posts'

module TumblrClientWrapper
	module Helpers
		include TumblrClientWrapper::Posts


		def embed_tumblr(blog_id, options = {})
			posts = embed_post(blog_id, options)
			return posts.html_safe
		end
	end
end