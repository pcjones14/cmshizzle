class CategoriesController < ApplicationController
  def index
  	@categories = Category.all
  end

  def show
  	@category = Category.find(params[:id])
  	@articles = Article.where(category_id: params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)

    if category.save
      flash[:success] = ['Category was successfully created.']
      redirect_to categories_path
    else
      flash[:error] = category.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update

    category = Category.find(params[:id])

    if category.update(category_params)
      flash[:success] = ['Category was successfully updated.']
      redirect_to categories_path
    else
      flash[:error] = category.errors.full_messages
      redirect_to :back
    end

  end

  def destroy

    category = Category.find(params[:id])

    if category.destroy
      flash[:success] = ['Category was successfully deleted.']
      redirect_to categories_path
    else
      flash[:error] = category.errors.full_messages
      redirect_to :back
    end

  end

  private

    def category_params
      params.require(:category).permit(:title)
    end

end
