require 'spec_helper'

describe Post do
  describe '#assign_tags' do
    it "should create new tags" do
      post = Post.create(
        title: "Post_1",
        content: "This is some content",
        tag_names: "Basketball Baseball Soccer"
      )

      list_of_tag_names_created = post.tags.map(&:name)
      list_of_tag_names_created.should =~ ["Basketball" , "Baseball", "Soccer"]
    end
  end

  describe ".all_matching_tags" do
    it "should return a specific posts with matching tags" do
    post_1 = Post.create(title: "Post_1", content: "content_1", tag_names: "Baseball Basketball Tennis")
    post_2 = Post.create(title: "Post_2", content: "content_2", tag_names: "Rugby Baseball Soccer")
    post_3 = Post.create(title: "Post_3", content: "content_3", tag_names: "Basketball")

    lists_of_post_that_match_tags = Post.all_matching_tags("Basketball,Baseball")
    lists_of_post_that_match_tags.should =~ [post_1]
    end
  end
end
