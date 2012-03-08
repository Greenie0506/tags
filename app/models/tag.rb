class Tag < ActiveRecord::Base
  has_many :post_tags, :dependent => :destroy
  has_many :posts, :through => :post_tags


  def self.get_posts(id)
    tag = Tag.find(id)
    posts = tag ? tag.posts : nil
  end

end
