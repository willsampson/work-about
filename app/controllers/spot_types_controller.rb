class SpotTypesController < ApplicationController
  def index
    matching_spot_types = SpotType.all

    @list_of_spot_types = matching_spot_types.order({ :created_at => :desc })

    render({ :template => "spot_types/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_spot_types = SpotType.where({ :id => the_id })

    @the_spot_type = matching_spot_types.at(0)

    render({ :template => "spot_types/show.html.erb" })
  end

  def create
    the_spot_type = SpotType.new
    the_spot_type.spot_id = params.fetch("query_spot_id")
    the_spot_type.category_id = params.fetch("query_category_id")

    if the_spot_type.valid?
      the_spot_type.save
      redirect_to("/spot_types", { :notice => "Spot type created successfully." })
    else
      redirect_to("/spot_types", { :alert => the_spot_type.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_spot_type = SpotType.where({ :id => the_id }).at(0)

    the_spot_type.spot_id = params.fetch("query_spot_id")
    the_spot_type.category_id = params.fetch("query_category_id")

    if the_spot_type.valid?
      the_spot_type.save
      redirect_to("/spot_types/#{the_spot_type.id}", { :notice => "Spot type updated successfully."} )
    else
      redirect_to("/spot_types/#{the_spot_type.id}", { :alert => the_spot_type.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_spot_type = SpotType.where({ :id => the_id }).at(0)

    the_spot_type.destroy

    redirect_to("/spot_types", { :notice => "Spot type deleted successfully."} )
  end
end
