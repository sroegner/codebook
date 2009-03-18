class CodeCategory < ActiveRecord::Base


  validates_presence_of :name, :type
  validates_uniqueness_of :name, :scope => :type
  named_scope :ordered, :order => 'name'    
end
