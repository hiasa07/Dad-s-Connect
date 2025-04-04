class Post < ApplicationRecord
  attachment :image
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true, length: { maximum: 30 }
  validates :text, presence: true, length: { maximum: 195 }
  validates :image, presence: true

  enum status: { published: 0, draft: 1 }

    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end

    before_create :set_default_views

    private
    
    def set_default_views
      self.views = 0
    end
    
end