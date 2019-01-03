class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        admin_root_path
    end

    def after_sign_out_path_for(resource)
        admin_root_path
    end

    def authenticate_admin_user!
      authenticate_user!
        # current_userはdevise提供のメソッドです。
        # 権限ユーザのroleについては、好きな方法でよいです。（自分の場合、has_roleメソッドで実装）
      unless current_user.has_role 'admin'
        flash[:alert] = "管理者用ページです。権限があるアカウントでログインしてください。"
        redirect_to root_path
      end
    end
end
