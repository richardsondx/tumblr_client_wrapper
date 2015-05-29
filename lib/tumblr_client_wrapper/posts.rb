require 'tumblr_client'
require 'json'
module TumblrClientWrapper
  module Posts

    VALID_OPTION_KEYS = [
            :params,
            :id,
            :tag,
            :limit,
            :offset,
            :reblog_info,
            :type,
            :notes_info,
            :filter
          ]
    class ApiRequest
        def initialize
            @@tumblr_client = Tumblr::Client.new(client: :httpclient)
        end

        def get_posts(tumblr_id, options)
            unless options.present?
                response = @@tumblr_client.posts("#{tumblr_id}.tumblr.com")
            else
                response = @@tumblr_client.posts("#{tumblr_id}.tumblr.com", options)
            end
        end

        def options(&block)
             VALID_OPTION_KEYS.each {|key| (options[key] = yield[key]) if yield[key]}
        end

        def paginate(tumbld_id, offset)
            response = @@tumblr_client.posts("#{tumblr_id}.tumblr.com", offset: offset)
        end

    end

    def embed_post(tumblr_id, options)
        api = ApiRequest.new
        posts = api.get_posts(tumblr_id, options)
        # binding.pry if posts["posts"].nil?
        embed = ""
        if posts["posts"]
          posts["posts"].each do |post|
              post_type = post["type"]
              case post_type
              when "text" 
                  title = post["title"]
                  body = post["body"]
                  embed += %Q(
                      <div class="post_content">
                          <div class="post_container">
                              <div class="post_title">
                                  #{title}
                              </div>
                              <div class="post_body">
                                  #{body}
                              </div>
                          </div>
                      </div>
                      )
      
              when "photo" 
                  caption    = post["caption"]
                  link_url   = post["link_url"]
                  photos     = post["photos"]
                  photos_embed = ""
                  photos.each do |photo|
                      photos_embed += %Q(
                          <a href="#{link_url}">
                                  <img src="#{photo["original_size"]["url"]}" width="#{photo["original_size"]["width"]}" height="#{photo["original_size"]["height"]}" alt="#{caption}">
                          </a>
                      )
                  end
  
                  embed += %Q(
                      <div class="post_content">
                          <div class="post_media">
                              #{photos_embed}
                          </div>
                          <div class="body">
                              #{caption}
                          </div>
                      </div>
                      )
  
              when "quote" 
                  content      = post["text"]
                  source       = post["source"]
                  date         = post["date"]
                  # source_url   = post["source_url"]
                  # source_title = post["source_title"]
                  embed += %Q(
                      <div class="post_content">
                          <div class="post_title extra_large">
                              <blockquote>
                                  <p>#{content}</p>
                              </blockquote>
                          </div>
                        )
                  unless source.empty?
                    embed += %Q(
                          <div class="post_body">
                                      <p>- #{source}</p>
                          </div>
                          ) 
                  end
                  embed  += %Q(
                      </div>
                      )
  
              when "link" 
                  title       = post["title"]
                  url         = post["url"]
                  author      = post["author"]
                  excerpt     = post["excerpt"]
                  publisher   = post["publisher"]
                  photos      = post["photos"]
                  description = post["description"]
                  binding.pry
                  embed += %Q(
                      <div class="post_content">
                          <div class="post_media">
                              <div class="link_button">
                                  <a href="#" class="link_source_container">
  
                                  </a>
                              </div>
                          </div>
                          <dvi class="post_body">
                              <p>#{description}</p>
                          </div>
                          
                      </div>
                      )
  
              when "chat"
                  title       = post["title"]
                  body        = post["body"]
                  dialogue    = post["dialogue"]
                  embed       += %Q(
                      <div class="post_content">
                          <div class="post_title">Post Tile"</div>
                          <div class="post_body">
                              <ul class="conversation_lines">
                                  <li class="chat_line">
                                      <strong></strong>
  
                                  </li>
                              </ul>
                          </div>
                      </div>
                      )
  
              when "audio"
                  source_url    = post["source_url"]
                  source_title  = post["source_title"]
                  id3_title     = post["id3_title"]
                  caption       = post["caption"]
                  player        = post["player"]
                  plays         = post["plays"]
  
                  embed         += %Q(
                      <div class="post_content">
                          <div class="post_media" style="width: 540px; height: 304px;">
                              <iframe src="#{source_url}"></iframe>
                          </div>
                          <div class="post_body">
                              #{caption}
                          </div>
                      </div>
                      )   
                  
              when "video"
                  source_url    = post["source_url"]
                  source_title  = post["source_title"]
                  caption       = post["caption"]
                  player        = post["player"]  
                  embed         += %Q(
                      <div class="post_content">
                          <div class="post_media" style="width: 540px; height: 304px;">
                              <iframe src="#{source_url}"></iframe>
                          </div>
                          <div class="post_body">
                              #{caption}
                          </div>
                      </div>
                      )   
  
              when "answer" 
                  question      = post["question"]
                  answer        = post["answer"]
                  embed         = %Q()
              end
          end
        end
        return embed
    end
  end
end