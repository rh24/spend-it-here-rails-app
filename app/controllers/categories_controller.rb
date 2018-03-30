class CategoriesController < ApplicationController
  before_action :require_login, except: [:show, :index]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(id: params[:id])
    @businesses = Business.where(category_id: @category.id)
  end
end
