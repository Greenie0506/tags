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
    tags = tag.split(" ")

    tag = tags.map{ |tag| Tag.where(name: tag) }

    post_tags = tag.flatten.map{ |t| PostTag.where(tag_id: t.id) }

    post_tags.flatten.map do |p|
      p.post
    end
  end

end
