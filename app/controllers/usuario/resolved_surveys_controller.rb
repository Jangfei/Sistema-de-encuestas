class Usuario::ResolvedSurveysController < ApplicationController
  resource_controller
  add_default_resource_methods
  
  belongs_to :survey
  
  new_action.before do
    
    object.survey.sections.each do |s|
      s.questions.each do |q|
        object.answers.build(:question_id => q.id)
      end
    end
    
  end
  
  create.before do
    object.fecha_resolucion = Date.today
  end
  create do
    wants.html {
       redirect_to usuario_surveys_url
    }
  end
  
end
