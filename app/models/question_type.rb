class QuestionType < ActiveRecord::Base
  attr_accessible :descripcion
  has_many :questions
  
  TEXTO = "texto"
  ABIERTA = "abierta"
  OPCION_MULTIPLE = "opcion_multiple"
  FALSO_VERDADERO = "falso_verdadero"
  
  TIPOS = [ABIERTA, TEXTO, OPCION_MULTIPLE, FALSO_VERDADERO]
  
  def to_s
    I18n.t(self.descripcion)
  end
  
  
end
