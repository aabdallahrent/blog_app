class CommentsController < ApplicationController
  def create
    # get the article
    @article = Article.find(params[:article_id])
    # create a new comment within the article using the
    # comment parameters, whitelisted in the private method below.
    # we needed @article.comments.create to nest the comments within this particular article.
    @comment = @article.comments.create(comment_params)
    # redirect to article_path found in routes when done.
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
