class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@post_images = @user.post_images.page(params[:page]).reverse_order
#そのユーザ（@user）に関連付けられた投稿（.post_images）のみ、@post_imagesに渡すことができる
  end

  def edit
  	@user = User.find(params[:id])
#params[:id]でユーザの情報を取得してインスタンス（@user）に保存し、編集用Viewでform_forを使う準備
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(user.id)
  end

  private
  def user_params
  	params.require(:user).permit(:name,:profile_image)
  	# データのオブジェクト名:userを指定しpermitでキー(:name,:profile_image)を指定
  	# これにより、user_paramsの中にフォームで入力されたデータが格納される
  end
end
