class CommentsController < ApplicationController
  def create
      # puts params.inspect
	    @article = Article.find(params[:article_id])
      puts @article.inspect                         #for security purposes only 
	    @comment = @article.comments.create(comment_params)
      # puts @comment
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
