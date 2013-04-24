class Administrador::ResolvedSurveysController < ApplicationController
  resource_controller
  add_default_resource_methods
  
  belongs_to :survey
  
end
