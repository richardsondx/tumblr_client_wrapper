require 'tumblr_client_wrapper/posts'

module TumblrClientWrapper
	module Helpers

		def embed_tumblr(blog_id, type = nil)
			embed = %Q(
				<div class="tumblr_wraper">
					#{embed_post posts(blog_id, type)}
				</div>
			)
		end
	end
end