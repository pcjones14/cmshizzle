class ArticlesController < ApplicationController
  
  def index
  	@articles = Article.all.order(updated_at: :desc)
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
  		flash[:success] = ['Article was successfully created.']
  		redirect_to articles_path
  	else
  		flash[:error] = article.errors.full_messages
      redirect_to :back
  	end

  end

  def edit
  	@article = Article.find(params[:id])
  end

  def update

    article = Article.find(params[:id])

  	if article.update(article_params)
  		flash[:success] = ['Article was successfully updated.']
  		redirect_to articles_path
  	else
      flash[:error] = article.errors.full_messages
      redirect_to :back
    end

  end

  def destroy

    article = Article.find(params[:id])

  	if article.destroy
  		flash[:success] = ['Article was successfully deleted.']
  		redirect_to articles_path
  	else
      flash[:error] = article.errors.full_messages
      redirect_to :back
    end

  end

  private
  	def article_params
  		params.require(:article).permit(:title, :summary, :text, :author, :visible)
  	end

end
