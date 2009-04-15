class CodeDocument < ActiveRecord::Base
  
  belongs_to :code_area
  belongs_to :code_language
 
  belongs_to :users, :foreign_key => :author_id
  
  validates_length_of :title, :maximum => 60

  # See http://www.redmine.org/issues/3021
  # the redmine search can not be used by plugins yet
  acts_as_searchable :columns => ["title","#{table_name}.description","#{table_name}.code"], :date_column => "created_at"

  def authorname(format="short")
    un = User.find(:first, :conditions => ['id=?', self.author_id], :select => "firstname,lastname" )
    format.eql?("short") ? un.firstname : "#{un.firstname} #{un.lastname}"
  end
end
