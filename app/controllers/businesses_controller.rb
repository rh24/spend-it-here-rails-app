class BusinessesController < ApplicationController
  before_action :require_login, except: [:show, :index]
  def new
    @business = Business.new
  end

  def create

  end
end
