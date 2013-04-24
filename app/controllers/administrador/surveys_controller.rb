class Administrador::SurveysController < ApplicationController
  resource_controller
  add_default_resource_methods
  
  create.before do
    object.fecha_creacion = Date.today
  end
  
end
