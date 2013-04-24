class Administrador::OptionsController < ApplicationController
  resource_controller
  add_default_resource_methods
  
  belongs_to :question
  
  create do
    wants.js {
      if request.xhr?
        render "create", :format =>:js
      end
    }
  end

  update do
    wants.js {
      if request.xhr?
        render "update", :format =>:js
      end
    }
  end
end
