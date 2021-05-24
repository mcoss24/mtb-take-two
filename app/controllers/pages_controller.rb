class PagesController < ApplicationController

  def index 
    render({ :template => "pages/index.html.erb" })
  end

  def plan
    render({ :template => "pages/plan.html.erb" })
  end

  def selected
    
    @list = params.keys()
    #@long = @list.length
        
    @season = @list.at(0)
    @geography = params.fetch("geography").capitalize
    @climate = params.fetch("climate").capitalize
    @type = @list.at(-3)

    @query1 = Spot.where({@season => true}).where({:geography => @geography}).where({ :climate => @climate}).where({@type => true}).first
    #@query2 = Spot.where({@season => true}).where({:geography => @geography}).where({ :climate => @climate}).where({@type => true}).at(1)

    if @query1 == nil 
      @failure = "We're sorry, but you are a failure! Try entering criteria that exist"
    else
      @recc1 = @query1.location 
      #@recc2 = @query2.location 
    end
     
    render({:template => "pages/selected.html.erb"})
  end
    

end