class MonstersController < ApplicationController
	respond_to :html

  	def index
  	    
  	    @monsters = Monster.order(sort_column + " " + sort_direction)

  	    unless params["show.all"].to_i==1
  	    	@monsters = @monsters.where("monsters.exp != 0")
  	    end
  	    	respond_with(@monsters)
  	    end

        def show
          respond_with(@monster = Monster.find(params[:id]))
    end

    def sort_column
    	Monster.column_names.include?(params["sort.by"]) ? params["sort.by"] : "ironame"
    end    

    def sort_direction
    	%w[asc desc].include?(params["sort.order"]) ? params["sort.order"] : "asc"
    end

    helper_method :sort_column, :sort_direction

end
