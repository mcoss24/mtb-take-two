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
    
        
    @season = @list.at(0) 
    @geography = params.fetch("geography").capitalize
    @climate = params.fetch("climate").capitalize
    @type = @list.at(-3)

    @query1 = Spot.where({@season => true}).where({:geography => @geography}).where({ :climate => @climate}).where({@type => true}) # get the record the based on the 
                                                                                                                                    # based on the user's prefs
    #@photo = Photo.where({:spot_id => })

    if @query1 == nil 
      @failure = "We're sorry, but you are a failure! Try entering criteria that exist"
    else
      @recc1 = @query1 
      
    end
     
    render({:template => "pages/selected.html.erb"})
  end
    

end