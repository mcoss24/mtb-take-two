class TrailsController < ApplicationController
  def index
    matching_trails = Trail.all

    @list_of_trails = matching_trails.order({ :created_at => :desc })

    render({ :template => "trails/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_trails = Trail.where({ :id => the_id })

    @the_trail = matching_trails.at(0)

    render({ :template => "trails/show.html.erb" })
  end

  def create
    the_trail = Trail.new
    the_trail.name = params.fetch("query_name")
    begin
      the_trail.spot_id = Spot.where({ :location => params.fetch("query_spot_id")}).first.id
    rescue
      the_trail.spot_id = false
    end
    the_trail.link = params.fetch("query_link")

    if the_trail.spot_id.valid?
      the_trail.save
      redirect_to("/trails", { :notice => "Trail created successfully." })
    else
      redirect_to("/trails", { :notice => "Trail failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_trail = Trail.where({ :id => the_id }).at(0)

    the_trail.name = params.fetch("query_name")
    the_trail.spot_id = params.fetch("query_spot_id")
    the_trail.link = params.fetch("query_link")

    if the_trail.valid?
      the_trail.save
      redirect_to("/trails/#{the_trail.id}", { :notice => "Trail updated successfully."} )
    else
      redirect_to("/trails/#{the_trail.id}", { :alert => "Trail failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_trail = Trail.where({ :id => the_id }).at(0)

    the_trail.destroy

    redirect_to("/trails", { :notice => "Trail deleted successfully."} )
  end
end
