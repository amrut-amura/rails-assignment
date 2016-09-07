class ArticlesController < ApplicationController
	
	def index
		@article = Article.all
		puts request.env["REMOTE_ADDR"]
		# puts response.inspect
	end
	def app
		# head :bad_request
		redirect_to "https://www.google.com"
	end
	def show
		@article = Article.find(params[:id])
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
		   	 	redirect_to @article
		   	 	puts @article.object_id
		  else
		    	render 'new'
		  end
	end
	def update
		  @article = Article.find(params[:id])
		 
		  if @article.update(article_params)
		    	redirect_to @article
		  else
		    	render 'edit'
		  end
	end
	def destroy
		  @article = Article.find(params[:id])
		  @article.destroy
		 
		  redirect_to articles_path
	end

	private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
