class Usuario::SurveysController < ApplicationController
  resource_controller
  add_default_resource_methods
  
  index do 
    wants.json {
      render :json => @search.result.to_json(:include => {:sections => {:questions => :options}})
    }
  end
end
