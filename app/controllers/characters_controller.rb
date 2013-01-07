class CharactersController < ApplicationController
    
    respond_to :html

	def index

  	@characters = Character.order(sort_column + " " + sort_direction)
  	
  		respond_with(@characters)
      
  end

  def show
  	respond_with(@character = Character.find(params[:id]))
  end

  def sort_column
    	Character.column_names.include?(params["sort.by"]) ? params["sort.by"] : "jobname"
    end    

    def sort_direction
    	%w[asc desc].include?(params["sort.order"]) ? params["sort.order"] : "asc"
    end

    helper_method :sort_column, :sort_direction

end
