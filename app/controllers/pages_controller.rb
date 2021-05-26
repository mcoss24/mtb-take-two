class PagesController < ApplicationController

  def index 
    render({ :template => "pages/index.html.erb" })
  end

  def plan
    render({ :template => "pages/plan.html.erb" })
  end

  def selected
    
    @list = params.keys() # what is in the params hash?
    @long = @list.count # how long is it?
    
        
    @season = params.fetch("season", "summer") 
    @geography = params.fetch("geography", "Mountain")
    @climate = params.fetch("climate", "Temperate")
    @type = params.fetch("type", "cross_country")


    @query1 = Spot.where({@season => true}).where({:geography => @geography}).where({ :climate => @climate}).where({@type => true}) # get the record  
                                                                                                                                    
    
    if @query1.first == nil 
      
      redirect_to("/plan", { :alert => "The criteria selected do not match a destination. Please try again!"})
    else
      @recc1 = @query1 
      render({:template => "pages/selected.html.erb"})
    end   
  end
    

end