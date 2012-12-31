class MonstersController < ApplicationController
  def index
  end

  def show
  	@monster = Monster.find(params[:id])
  end
end
