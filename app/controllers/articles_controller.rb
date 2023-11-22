class ArticlesController < ApplicationController
    before_action :login_required

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:success] = "記事を投稿しました。"
            redirect_to articles_path, status: :see_other
        else
            render new_article_path
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

    def article_params
        params.require(:article).permit(:title, :body).merge(user_id:1, category_id:1)
    end
end
