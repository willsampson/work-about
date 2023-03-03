class AmenitiesController < ApplicationController
  def index
    matching_amenities = Amenity.all

    @list_of_amenities = matching_amenities.order({ :created_at => :desc })

    render({ :template => "amenities/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_amenities = Amenity.where({ :id => the_id })

    @the_amenity = matching_amenities.at(0)

    render({ :template => "amenities/show.html.erb" })
  end

  def create
    the_amenity = Amenity.new
    the_amenity.outlets = params.fetch("query_outlets")
    the_amenity.coffee = params.fetch("query_coffee", false)
    the_amenity.food = params.fetch("query_food", false)
    the_amenity.wifi = params.fetch("query_wifi", false)
    the_amenity.transit_access = params.fetch("query_transit_access")
    the_amenity.seating = params.fetch("query_seating")
    the_amenity.noise = params.fetch("query_noise")
    the_amenity.spot_id = params.fetch("query_spot_id")

    if the_amenity.valid?
      the_amenity.save
      redirect_to("/amenities", { :notice => "Amenity created successfully." })
    else
      redirect_to("/amenities", { :alert => the_amenity.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_amenity = Amenity.where({ :id => the_id }).at(0)

    the_amenity.outlets = params.fetch("query_outlets")
    the_amenity.coffee = params.fetch("query_coffee", false)
    the_amenity.food = params.fetch("query_food", false)
    the_amenity.wifi = params.fetch("query_wifi", false)
    the_amenity.transit_access = params.fetch("query_transit_access")
    the_amenity.seating = params.fetch("query_seating")
    the_amenity.noise = params.fetch("query_noise")
    the_amenity.spot_id = params.fetch("query_spot_id")

    if the_amenity.valid?
      the_amenity.save
      redirect_to("/amenities/#{the_amenity.id}", { :notice => "Amenity updated successfully."} )
    else
      redirect_to("/amenities/#{the_amenity.id}", { :alert => the_amenity.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_amenity = Amenity.where({ :id => the_id }).at(0)

    the_amenity.destroy

    redirect_to("/amenities", { :notice => "Amenity deleted successfully."} )
  end
end
