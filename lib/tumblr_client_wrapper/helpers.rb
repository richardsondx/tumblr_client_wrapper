require 'tumblr_client_wrapper/posts'

module TumblrClientWrapper
	module Helpers
		include TumblrClientWrapper::Posts


		def embed_tumblr(blog_id, options = {})
			embed = %Q(
				<div class="tumblr_wraper">
					#{embed_post(blog_id, options)}
				</div>
			)
		end
	end
end