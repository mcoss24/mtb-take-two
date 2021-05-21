Rails.application.routes.draw do

  # Routes for the Spot resource:

  # CREATE
  post("/insert_spot", { :controller => "spots", :action => "create" })
          
  # READ
  get("/spots", { :controller => "spots", :action => "index" })
  
  get("/spots/:path_id", { :controller => "spots", :action => "show" })
  
  # UPDATE
  
  #post("/modify_spot/:path_id", { :controller => "spots", :action => "update" })
  
  # DELETE
  #get("/delete_spot/:path_id", { :controller => "spots", :action => "destroy" })

  #------------------------------

  # Routes for the Trail resource:

  # CREATE
  post("/insert_trail", { :controller => "trails", :action => "create" })
          
  # READ
  get("/trails", { :controller => "trails", :action => "index" })
  
  get("/trails/:path_id", { :controller => "trails", :action => "show" })
  
  # UPDATE
  
  post("/modify_trail/:path_id", { :controller => "trails", :action => "update" })
  
  # DELETE
  #get("/delete_trail/:path_id", { :controller => "trails", :action => "destroy" })

  #------------------------------
  # Routes for the Photo resource:

  # CREATE
  post("/insert_photo", { :controller => "photos", :action => "create" })
          
  # READ
  get("/photos", { :controller => "photos", :action => "index" })
  
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  
  # UPDATE
  
  post("/modify_photo/:path_id", { :controller => "photos", :action => "update" })
  
  # DELETE
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })

  #------------------------------



end
