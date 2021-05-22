class PagesController < ApplicationController

  def index 
    render({ :template => "pages/index.html.erb" })
  end

  def plan
    render({ :template => "pages/plan.html.erb" })
  end

  def selected
    
    @list = params.keys()
        
    @season = @list.at(0)
    @geography = @list.at(1)
    @climate = @list.at(2)
    @type = @list.at(3)

    @query = Spot.where({@season => true}).where({@geography => true}).where({@climate => true}).where({@type => true}).first

    if @query == nil
      @failure = "We're sorry, but you are a failure"
    else
      @recc = @query.location 
    end
     
    render({:template => "pages/selected.html.erb"})
  end
    

end