class ApplicationController < ActionController::Base
    include UsersHelper
    include MarkdownsHelper

    private

    # ログインしていなかったらログイン画面にリダイレクト
    def login_required
        redirect_to new_user_path unless current_user
    end
end
