class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    # test if the article appears
    # render plain: params[:article].inspect

    # save the article then redirect to show template
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_show(@article)
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end