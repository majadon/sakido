class ItemsController < ApplicationController

	respond_to :html

  	def index
  	    
  	    @items = Item.order(sort_column + " " + sort_direction)

        unless params["show.all"].to_i==1
          @items = @items.where("items.name != ('') | items.loc != 0")
        end

        unless params[:name].blank?
          @items = @items.where("name like ?", "%#{params[:name]}%")
        end

  	    	respond_with(@items)
  	end

    def show
        respond_with(@item = Item.find(params[:id]))
    end

    def sort_column
    	Item.column_names.include?(params["sort.by"]) ? params["sort.by"] : "name"
    end    

    def sort_direction
    	%w[asc desc].include?(params["sort.order"]) ? params["sort.order"] : "asc"
    end

    helper_method :sort_column, :sort_direction
  
end
