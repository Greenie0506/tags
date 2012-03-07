class PostTag < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag



  
  # def self.get_tag
    # Post.where("tag = ?", params[:tags])
  # end

end
