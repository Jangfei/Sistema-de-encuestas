class Administrador::ResolvedSurveysController < ApplicationController
  resource_controller
  add_default_resource_methods

  belongs_to :survey
  
  def charts
    
    answers = Answer.joins(:question => :question_type).joins(:resolved_survey).
      where("question_types" => {:descripcion => [QuestionType::OPCION_MULTIPLE, QuestionType::FALSO_VERDADERO]}, "resolved_surveys" => {:survey_id => parent_object}).
      select("questions.descripcion as pregunta, answers.descripcion as opcion, COUNT(answers.descripcion) as cantidad").
      group(["pregunta", "opcion"])
      
    data_array = [['Pregunta', 'Opcion', 'Cantidad']].concat(answers.map {|a| [a.pregunta, a.opcion, a.cantidad]})          
    @data =  data_array.to_json.html_safe
  end

end
