class CodeDocument < ActiveRecord::Base
  
  belongs_to :code_area, :foreign_key => :category_id
  belongs_to :code_language, :foreign_key => :language_id

end
