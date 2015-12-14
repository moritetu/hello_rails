class Blog < ActiveRecord::Base
  has_many :entries
  has_many :comments, through: :entries

  validates :title, presence: true
end
