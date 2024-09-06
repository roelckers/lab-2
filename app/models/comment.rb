class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :content, presence: true
  validates :author, presence: true
  validate :author_must_be_valid_user

  private

  def author_must_be_valid_user
    unless User.exists?(email: author)
      errors.add(:author, 'must be a valid user')
    end
  end
end
