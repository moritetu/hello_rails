class Entry < ActiveRecord::Base
  has_many :comments
  belongs_to :blog

  validates :blog_id, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
