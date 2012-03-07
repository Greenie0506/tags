class Tag < ActiveRecord::Base
  has_many :post_tags, :dependent => :destroy
  has_many :posts, :through => :post_tags


  def self.get_tag
    Post.where("tag = ?", params[:name])
  end

end
