class CodeDocument < ActiveRecord::Base
  
  belongs_to :code_area, :foreign_key => :category_id
  belongs_to :code_language, :foreign_key => :language_id
  belongs_to :users, :foreign_key => :author_id
  
  def authorname(format="short")
    un = User.find(:first, :conditions => ['id=?', self.author_id], :select => "firstname,lastname" )
    format.eql?("short") ? un.firstname : "#{un.firstname} #{un.lastname}"
  end
end
