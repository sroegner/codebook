class CodeCategory < ActiveRecord::Base


  validates_presence_of :name, :type
  validates_uniqueness_of :name, :scope => :type
  
  def has_documents?
    (self.code_documents.empty? == false)
  end
  
end
