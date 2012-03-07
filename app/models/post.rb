class Post < ActiveRecord::Base
  attr_accessor :tag_names
  has_many :post_tags, :dependent => :destroy
  has_many :tags, :through => :post_tags
  after_save :assign_tags

  # def self.tagged_with
    # @articles = Article.tagged(params[:tag])
  # end

  def self.by_tag
    lambda{ |tag| where(:tag => tag) }
  end

  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/\s+/).map do |name|
        Tag.find_or_create_by_name()
      end
    end
  end



end
