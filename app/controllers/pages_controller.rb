class PagesController < ApplicationController

  def index 
    render({ :template => "pages/index.html.erb" })
  end

  def plan
    render({ :template => "pages/plan.html.erb" })
  end

  def selected
    
    @list = params.keys()
    @long = @list.count
        
    @season = @list.at(0)
    @geography = params.fetch("geography").capitalize
    @climate = params.fetch("climate").capitalize
    @type = @list.at(-3)

    @query1 = Spot.where({@season => true}).where({:geography => @geography}).where({ :climate => @climate}).where({@type => true})
    
    if @query1 == nil 
      @failure = "We're sorry, but you are a failure! Try entering criteria that exist"
    else
      @recc1 = @query1 
      
    end
     
    render({:template => "pages/selected.html.erb"})
  end
    

end