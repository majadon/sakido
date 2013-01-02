class ItemsController < ApplicationController

	respond_to :html

  	def index
  	    
  	    @items = Item.order(sort_column + " " + sort_direction)

  	    #unless params["show.all"].to_i==1
  	    #	@items = @items.where("monsters.exp != 0")
  	    #end
  	    @heal = Item.where("items.modeltype == 0")
  	    @use = Item.where("items.modeltype == 2")
  	    @etc = Item.where("items.modeltype == 3")
  	    @weapon = Item.where("items.modeltype == 4")
  	    @armor = Item.where("items.modeltype == 5")
  	    @card = Item.where("items.modeltype == 6")

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
