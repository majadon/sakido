class MapsController < ApplicationController

	respond_to :html

	def index
		@maps = Map.order(sort_column + " " + sort_direction)

		#unless params["show.all"].to_i==1
  	    #	@monsters = @monsters.where("monsters.hp != 0")
  	    #end

        unless params[:name].blank?
          @maps = @maps.where("map_id like ?", "%#{params[:name]}%")
        end

		respond_with(@maps = @maps.page(params[:page]))
	end

	def show
        respond_with(@map = Map.find(params[:id]))
    end




	def sort_column
    	Map.column_names.include?(params["sort.by"]) ? params["sort.by"] : "map_id"
    end    

    def sort_direction
    	%w[asc desc].include?(params["sort.order"]) ? params["sort.order"] : "asc"
    end

    helper_method :sort_column, :sort_direction

end
