class MonstersController < ApplicationController
	respond_to :html

  	def index
  	    
  	    @monsters = Monster.order(sort_column + " " + sort_direction)

  	    unless params["show.all"].to_i==1
  	    	@monsters = @monsters.where("monsters.exp != 0")
  	    end

        unless params[:name].blank?
          @monsters = @monsters.where("ironame like ?", "%#{params[:name]}%")
        end

        unless params[:lv].blank?
          params[:lvrange] = 15 if params[:lvrange].blank?
          params[:lvrange] = params[:lvrange].to_i
          lv = params[:lv].to_i
          lv1 = lv-params[:lvrange]
          lv2 = lv+params[:lvrange]
          @monsters = @monsters.where(:lv => lv1..lv2)
        end

  	    	respond_with(@monsters = @monsters.page(params[:page]))
  	end

        def show
          respond_with(@monster = Monster.find(params[:id]))

        end

    def sort_column
    	Monster.column_names.include?(params["sort.by"]) ? params["sort.by"] : "lv"
    end    

    def sort_direction
    	%w[asc desc].include?(params["sort.order"]) ? params["sort.order"] : "desc"
    end

    helper_method :sort_column, :sort_direction

end
