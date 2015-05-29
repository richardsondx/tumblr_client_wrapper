module TumblrWrapperClient
    module Embed
        extend TumblrWrapperClient::Posts 
        
        def embed_post(posts)
        posts["posts"].each do |post|
            post_type = post["type"]
            case post_type
            when "text" 
                title = post["title"]
                body = post["body"]
               
                embed = %Q(
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
                    photos_embed = %Q(
                        <a href="#{link_url}">
                                <img src="#{photo["original_size"]["url"]}" width="#{photo["original_size"]["width"]}" height="#{photo["original_size"]["height"]}" alt="#{caption}">
                        </a>
                    )
                end

                embed = %Q(
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
                source_url   = post["source_url"]
                source_title = post["source_title"]
                embed = %Q(
                    <div class="post_content">
                        <div class="post_title extra_large">
                            <blockquote>
                                <p>#{content}</p></a>
                            </blockquote>
                        </div>
                        <div class="post_body">
                                    <p>- #{source}</p>
                            </blockquote>
                        </div>

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
                embed = %Q(
                    <div class="post_content">
                        <div class="post_media">
                            <div class="link_button">
                                <a href="#" class="link_source_container">

                                </div>
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
                embed       = %Q(
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

                embed         = %Q(
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
                embed         = %Q(
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
  end
    end
end