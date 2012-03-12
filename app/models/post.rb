class Post < ActiveRecord::Base
  attr_accessor :tag_names
  has_many :post_tags, :dependent => :destroy
  has_many :tags, :through => :post_tags
  after_save :assign_tags

  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/\s+/).map do |name|
        Tag.find_or_create_by_name(name)
      end
    end
  end

  def self.all_matching_tags(tag)
    tags = tag.split(",")
    tags = Tag.find(:all, :conditions => ["name in (?)", tags])
    # Post.find(:all, :conditions => ["id in (?)", tags])
    # Post.where((:tags == tags) & (:tags.length == tags.length))

    Post.all.select{ |p| (p.tags & tags).length == tags.length }
  end

end
