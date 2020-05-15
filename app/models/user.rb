class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :post_images, dependent: :destroy

  	has_many :post_comments, dependent: :destroy
  # has_many :post_commentsは、Userモデル1に対して
  # PostCcommentモデル複数持つこと(1:Nの関係)を示す
  # dependent: :destroyはUserのデータが削除された時、
  # そのUserが投稿したコメントデータも一緒に削除される
  	has_many :favorites, dependent: :destroy


end
