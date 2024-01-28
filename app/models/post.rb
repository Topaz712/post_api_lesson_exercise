class Post < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

  has_many :comments
end
