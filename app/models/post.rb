class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  before_save :extract_hashtags

  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { minimum: 140 }
  validates :author, presence: true
  validates :published, presence: true

  enum published: { unpublished: 0, published: 1 }

  def self.most_used_hashtags
    hashtags = Post.where("created_at >= ?", Time.zone.now.beginning_of_day).pluck(:hashtags).flatten
    hashtags.group_by { |tag| tag }.transform_values(&:count).sort_by { |_, count| -count }.first(10)
  end

  private

  def extract_hashtags
    self.hashtags = content.scan(/#\w+/).map { |tag| tag.downcase.delete('#') }
  end
end
