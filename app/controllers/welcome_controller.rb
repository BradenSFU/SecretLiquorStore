class WelcomeController < ApplicationController
  def index
  end
  def drinkPage
    @drink = params[:drinkName]
  end
end
