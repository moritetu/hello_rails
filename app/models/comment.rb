class Comment < ActiveRecord::Base
  belongs_to :entry

  validates :body, presence: true
  validates :entry_id, presence: true

  def approve
    update(status: 1)
  end

  def approved?
    status == 1
  end
end
