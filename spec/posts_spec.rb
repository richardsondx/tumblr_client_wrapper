require 'json'

module TumblrClientWrapper
  describe Posts, type: :module do
    before do 
      file = File.read(File.expand_path("../response.json", __FILE__))
      @response = JSON.parse(file)
    end


    context  "embed_post" do 
      require 'tumblr_client_wrapper/posts'
  
      it "puts the content of a posts inside an html div" do 
        expect(TumblrClientWrapper::Posts.parse_text(@response["posts"][0])).to eq(
          "\n            <div class=\"post_content\">\n                <div class=\"post_date\">2014-12-14 18:32:10 GMT</div>\n                <div class=\"post_container\">\n                    <div class=\"post_title\">\n                        \n                    </div>\n                    <div class=\"post_body\">\n                        \n                    </div>\n                </div>\n            </div>\n            ")
      end
    end
  end
end