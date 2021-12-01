class Post < ApplicationRecord
	belongs_to :user
	has_many :articles
  before_create :b_create
  before_save :b_save
	after_create :a_create
    after_update :a_update
    after_save :a_save

  # validations
  validates :title, presence: true

  private

  def b_create
    Rails.logger.info 'b'
  end

  def b_save
    Rails.logger.info 'b_s'
  end

  def a_save
    Rails.logger.info 's'
  end

  def a_create
    Rails.logger.info 'f'
  end

  def a_update
    Rails.logger.info 'g'
  end
end


p = Post.new
p.save
Rails.logger.info 'o'
p.title = 'foo'
p.user_id = 1
p.save
p.update_attributes(title: 'bar')