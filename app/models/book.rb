class Book < ApplicationRecord

  validates :body, presence: true, uniqueness: true, length: { maximum: 200}

  belongs_to :user
  
  validates :title, presence: true
  validates :body, presence: true

end
