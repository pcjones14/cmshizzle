class ArticlesController < ApplicationController
  
  def index
  	@articles = Article.all.order(updated_at: :desc)
  end

  def show
  	@article = Article.find(params[:id])
  end

  def new
  	@article = Article.new

    #get the list of categories for select options
    @options_array = category_options

  end

  def create

  	article = Article.new(article_params)
    article.category = Category.find(params[:article][:category])

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
    #get the list of categories for select options
    @options_array = category_options
  end

  def update

    article = Article.find(params[:id])
    article.category = Category.find(params[:article][:category])

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
  		params.require(:article).permit(:title, :summary, :text, :author, :visible, :image)
  	end

    def category_options
      options = Category.all
      options_array = Array.new
      options.each do |option|
        options_array += [[option.title, option.id]]
      end
      return options_array
    end

end
