class ArticlesController < ApplicationController
	
	def index
		@article = Article.all
		render json: @article
	end
	def app
		redirect_to "https://www.google.com"
	end
	def show
		@article = Article.find(params[:id])
		render json: [@article,@article.comments]
	end

	def new
		@article = Article.new
	end
	def edit
		@article = Article.find(params[:id])
	end

	def create
		 @article = Article.new(article_params)
		  if @article.save
		  		flash[:notice] = " Article is successfully created."
		  		render json: @article
		  else
		    	render nothing: true, status: :bad_request
		  end
	end
	def update
		  @article = Article.find(params[:id])
		 
		  if @article.update(article_params)
		    	render json: @article
		  else
		    	render nothing: true, status: :bad_request
		  end
	end
	def destroy
		 @article = Article.find(params[:id])
		 if @article.destroy
		 	render nothing: true
		 else
		  render nothing: true, status: :bad_request
		 end
	end

	private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
