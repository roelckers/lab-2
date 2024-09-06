class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image
  before_save :extract_hashtags

  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { minimum: 140 }
  validates :author, presence: true
  validates :published, presence: true
  validate :author_must_be_valid_user

  enum published: { unpublished: 0, published: 1 }

  private

  def author_must_be_valid_user
    errors.add(:author, 'must be a valid user') unless User.exists?(email: author)
  end

  def extract_hashtags
    self.hashtags = content.scan(/#\w+/).map { |tag| tag.downcase.delete('#') }
  end

  def self.most_used_hashtags
    hashtags = Post.where("created_at >= ?", Time.zone.now.beginning_of_day).pluck(:hashtags).flatten
    hashtags.group_by { |tag| tag }.transform_values(&:count).sort_by { |_, count| -count }.first(10)
  end
end
