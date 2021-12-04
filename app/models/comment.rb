class Comment < ApplicationRecord
  acts_as_votable
  belongs_to :user
  belongs_to :promotion
  belongs_to :parent, class_name: 'Comment'
  has_many :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
end
