class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_image
  has_many :book_comments, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }   
  
  

end
