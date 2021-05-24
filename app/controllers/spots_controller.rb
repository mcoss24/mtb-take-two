class SpotsController < ApplicationController
  def index
    matching_spots = Spot.all

    @list_of_spots = matching_spots.order({ :created_at => :desc })

    render({ :template => "spots/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_spots = Spot.where({ :id => the_id })

    @the_spot = matching_spots.at(0)
    @trails = Trail.where({:spot_id => the_id})


    render({ :template => "spots/show.html.erb" })
  end

  def create
    the_spot = Spot.new
    the_spot.location = params.fetch("query_location")
    the_spot.climate = params.fetch("query_climate")
    the_spot.geography = params.fetch("query_geography")
    the_spot.winter = params.fetch("query_winter", false)
    the_spot.fall = params.fetch("query_fall", false)
    the_spot.spring = params.fetch("query_spring", false)
    the_spot.summer = params.fetch("query_summer", false)
    the_spot.cross_country = params.fetch("query_cross_country", false)
    the_spot.downhill = params.fetch("query_downhill", false)

    if the_spot.valid?
      the_spot.save
      redirect_to("/spots", { :notice => "Spot created successfully." })
    else
      redirect_to("/spots", { :notice => "Spot failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_spot = Spot.where({ :id => the_id }).at(0)

    the_spot.location = params.fetch("query_location")
    the_spot.climate = params.fetch("query_climate")
    the_spot.geography = params.fetch("query_geography")
    the_spot.winter = params.fetch("query_winter", false)
    the_spot.fall = params.fetch("query_fall", false)
    the_spot.spring = params.fetch("query_spring", false)
    the_spot.summer = params.fetch("query_summer", false)
    the_spot.cross_country = params.fetch("query_cross_country", false)
    the_spot.downhill = params.fetch("query_downhill", false)

    if the_spot.valid?
      the_spot.save
      redirect_to("/spots/#{the_spot.id}", { :notice => "Spot updated successfully."} )
    else
      redirect_to("/spots/#{the_spot.id}", { :alert => "Spot failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_spot = Spot.where({ :id => the_id }).at(0)

    the_spot.destroy

    redirect_to("/spots", { :notice => "Spot deleted successfully."} )
  end
end
