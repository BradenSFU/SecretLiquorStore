  class WelcomeController < ApplicationController
  before_filter :randomvariable
  def index
  end

  def randomvariable
    @rannum = rand(2886)

  end


end
