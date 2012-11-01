class Post < ActiveRecord::Base
  attr_accessible :content, :title, :tags_attributes

  validates :title, presence: true, length: { minimum: 5 }

  has_many :comments, dependent: :destroy
  has_many :tags, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :tags, allow_destroy: :true,
  reject_if: proc { |attrs| attrs.all? { |k,v| v.blank? } }

  # Returns the next post in the pagination when a post is deleted by doing ajax.
  #
  # Parameters:
  # - num_elemets_pagination: Number of post per page in the pagination.
  # - num_page: Number of the current page.
  #
  # Returns:
  # - The next post to be add to the current page.
  #
  def next_post_pagination(num_elements_pagination, num_page)
    page_posts = current_user.posts(order: "created_at DESC")
    # Gets the index for the next post to be show.
    index = (num_elements_pagination - 1) * num_page.to_i
    page_posts[index]
  end
end
