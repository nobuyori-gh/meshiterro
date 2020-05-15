class PostImage < ApplicationRecord
	attachment :image
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :post_comments, dependent: :destroy
	validates :shop_name, presence: true
	validates :image, presence: true
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
		# 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかを調べる
		# 存在していればtrue、存在していなければfalseを返す
	end
end
