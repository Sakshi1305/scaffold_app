class User < ApplicationRecord
  has_many :posts
  has_many :articles, through: :posts
end
