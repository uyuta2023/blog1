class SessionsController < ApplicationController
    skip_before_action :login_required

    # GET ログイン画面
    def new        
    end
    # POST ログイン
    def create
        user = User.find_by(email: params[:email].downcase)
        if user&.authenticate(params[:password])
            reset_session
            log_in(user)
            flash[:success] = "ログインしました。"
            redirect_to root_path
        else
            flash[:danger] = "メールアドレス、パスワードが間違っています。"
            render new_session_path
        end
    end
    # DELETE ログアウト
    def destroy
        log_out if logged_in?
        redirect_to new_session_path, status: :see_other
    end

end
