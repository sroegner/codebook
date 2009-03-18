class CodeArea < CodeCategory

  has_one :code_document

  
  def has_no_documents?
    CodeDocument.find(:first, :conditions => ['category_id = ?', self.id]).nil?
  end
  

end
