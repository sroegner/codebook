class CodeLanguage < CodeCategory

  has_one :code_document

  def has_no_documents?
    CodeDocument.find(:first, :conditions => ['language_id = ?', self.id]).nil?
  end

end
