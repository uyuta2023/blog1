class UsersController < ApplicationController
    skip_before_action :login_required, only:[:new, :create]

    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            reset_session
            log_in(@user)
            flash[:success] = "ユーザー登録が済みました。"
            redirect_to @user
        else
            render new_user_path
        end
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
