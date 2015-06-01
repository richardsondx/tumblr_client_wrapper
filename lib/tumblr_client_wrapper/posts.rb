require 'tumblr_client'
require 'json'
module TumblrClientWrapper
  module Posts

    class ApiRequest
    
      def initialize
          @@tumblr_client = Tumblr::Client.new(client: :httpclient)
      end

      def get_posts(tumblr_id, options)
          unless options.empty?
              response = @@tumblr_client.posts("#{tumblr_id}.tumblr.com")
          else
              response = @@tumblr_client.posts("#{tumblr_id}.tumblr.com", options)
          end
      end

      def paginate(tumbld_id, offset)
          response = @@tumblr_client.posts("#{tumblr_id}.tumblr.com", offset: offset)
      end
    end

    def embed_post(tumblr_id, options)
      api = ApiRequest.new
      posts = api.get_posts(tumblr_id, options)
      embed = ""
      if posts["posts"]
        posts["posts"].each do |post|
            post_type = post["type"]
            case post_type
            when "text" 
                embed += parse_text(post)
            when "photo" 
                embed += parse_photo(post)
            when "quote" 
                embed += parse_quote(post)
            when "link" 
                embed += parse_link(post)
            when "chat"
                embed += parse_chat(post)
            when "audio"
                embed += parse_audio(post)  
            when "video"
                embed += parse_video(post) 
            when "answer" 
                embed += parse_answer(post)
            end
        end
      end
      return embed
    end

    def parse_text(post)
        title = post["title"]
        body  = post["body"]
        date  = post["date"]
        embed = %Q(
            <div class="post_content">
                <div class="post_date">#{date}</div>
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
    end

    def parse_photo(post)
        caption      = post["caption"]
        link_url     = post["link_url"]
        photos       = post["photos"]
        date         = post["date"]
        photos_embed = ""
        photos.each do |photo|
            photos_embed = %Q(
                <a href="#{link_url}">
                        <img src="#{photo["original_size"]["url"]}" width="#{photo["original_size"]["width"]}" height="#{photo["original_size"]["height"]}" alt="#{caption}">
                </a>
            )
        end
  
        embed = %Q(
            <div class="post_content">
                <div class="post_date">#{date}</div>
                <div class="post_media">
                    #{photos_embed}
                </div>
                <div class="body">
                    #{caption}
                </div>
            </div>
            )
    end

    def parse_quote(post)
        content      = post["text"]
        source       = post["source"]
        date         = post["date"]
        embed = %Q(
            <div class="post_content">
                <div class="post_date">#{date}</div>
                <div class="post_title extra_large">
                    <blockquote>
                        <p>#{content}</p>
                    </blockquote>
                </div>
              )
        unless source.empty?
          embed += %Q(
                <div class="post_body">
                            <p class="source">- #{source}</p>
                </div>
                ) 
        end
        embed  += %Q(
            </div>
            )
    end

    def parse_link(post)
        title       = post["title"]
        url         = post["url"]
        author      = post["author"]
        excerpt     = post["excerpt"]
        publisher   = post["publisher"]
        photos      = post["photos"]
        description = post["description"]
        date        = post["date"]
        embed = %Q(
            <div class="post_content">
                <div class="post_date">#{date}</div>
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
    end

    def parse_chat(post)
        title       = post["title"]
        body        = post["body"]
        dialogue    = post["dialogue"]
        date        = post["date"]
        embed       = %Q(
            <div class="post_content">
                <div class="post_date">#{date}</div>
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
    end

    def parse_audio(post)
        if post[:type] == "audio"
            source_url    = post["source_url"]
            source_title  = post["source_title"]
            id3_title     = post["id3_title"]
            caption       = post["caption"]
            player        = post["player"]
            plays         = post["plays"]
            date          = post["date"]
    
            embed         = %Q(
                <div class="post_content">
                    <div class="post_date">#{date}</div>
                    <div class="post_media" style="width: 540px; height: 304px;">
                        <iframe src="#{source_url}"></iframe>
                    </div>
                    <div class="post_body">
                        #{caption}
                    </div>
                </div>
                )  
        end
    end

    def parse_video(post)
        source_url    = post["source_url"]
        source_title  = post["source_title"]
        caption       = post["caption"]
        player        = post["player"]  
        date          = post["date"]
        embed         = %Q(
            <div class="post_content">
                <div class="post_date">#{date}</div>
                <div class="post_media" style="width: 540px; height: 304px;">
                    <iframe src="#{source_url}"></iframe>
                </div>
                <div class="post_body">
                    #{caption}
                </div>
            </div>
            )  
    end

    def parse_answer(post)
        question      = post["question"]
        answer        = post["answer"]
        date          = post["date"]
        embed         = %Q(
                <div class="post_content">
                    <div class="post_date">#{date}</div>
                    <div class="post_container">
                        <div class="post_title">
                            #{question}
                        </div>
                        <div class="post_body">
                            #{answer}
                        </div>
                    </div>
                </div>
            )
    end

    module_function :parse_text, 
                :parse_photo, 
                :parse_quote, 
                :parse_link, 
                :parse_chat, 
                :parse_audio, 
                :parse_video, 
                :parse_answer

  end
end