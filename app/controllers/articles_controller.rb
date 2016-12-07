class ArticlesController < ApplicationController
  
  def index
  	@articles = Article.all
  end

  def show
  	@article = Article.find(params[:id])
  end

  def new
  	@article = Article.new
  end

  def create
  	article = Article.new(article_params)
  	if article.save
  		flash[:success] = 'Article was successfully created.'
  		redirect_to articles_path
  	else
  		abort("Something went wrong in saving")
  	end
  end

  def edit
  	@article = Article.find(params[:id])
  end

  def update
  	if Article.find(params[:id]).update(article_params)
  		flash[:success] = 'Article was successfully updated.'
  		redirect_to articles_path
  	end
  end

  def destroy
  	if Article.destroy(params[:id])
  		flash[:success] = 'Article was successfully deleted.'
  		redirect_to articles_path
  	end
  end

  private
  	def article_params
  		params.require(:article).permit(:title, :summary, :text, :author, :visible)
  	end

end
