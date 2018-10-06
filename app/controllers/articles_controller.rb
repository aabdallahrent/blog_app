class ArticlesController < ApplicationController
  def new
    # View requires an Article object which is we instantiate one here.
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    # reuse private method article_params
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def index
    @articles = Article.all
  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def create
    # render plain text and output the params for article.
    # render plain: params[:article].inspect

    # but we actually want it to save.
    # create a new Article using the article params
    # it is defined in the private method below and we use the params from the request.
    @article = Article.new(article_params)

    # call save. I huess you can think of model, more as ORM
    if @article.save # returns true when saved.
      redirect_to @article
    else
      # render new is the new method above.
      # we dont need to specify the controler beacuse we are currently in it.
      # also this is not a redirect!
      render 'new'
    end
  end

  def show
    # rails routes, its in there, lets retrieve the Artice
    # i know its a model because singular. Also, anytime you here ACTION, think controller.
    @article = Article.find(params[:id])
  end

  private
    def article_params
      # ActiveModel::ForbiddenAttributesError to prevent these, you need to whitelist
      # the params coming in. Security feature of rails...
        params.require(:article).permit(:title, :text)
    end
end
