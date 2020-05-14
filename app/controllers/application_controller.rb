class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # devise利用の機能（ユーザー登録、ログイン認証など）が使われる際、
  # その前にconfigure_permitted_parametersが実行される
  protected
  # privateでは自分のコントローラでしか参照できない。
  # 一方、protectedは呼び出された他のコントローラからも参照できる
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # configure_permitted_parametersでは、devise_parameter_sanitizer.permitで
    # nameのデータ操作を許可するアクションメソッドが指定されている。
  end

end
