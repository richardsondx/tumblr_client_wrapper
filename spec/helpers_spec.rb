require 'tumblr_client_wrapper/helpers'

module TumblrClientWrapper
  describe Helpers, type: :module do

    context "embed_tumblr" do 
      let(:action_base) {Class.new {include TumblrClientWrapper::Helpers}}
      it "should include the Helpers methods in rails Action::Base" do
        expect(action_base.instance_methods).to include(:embed_tumblr)
      end
    end
  end
end