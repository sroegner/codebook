class CreateCodeCategories < ActiveRecord::Migration
  def self.up
    create_table :code_categories do |t|
      t.column :id, :integer
      t.column :type, :string
      t.column :name, :string
    end
  end

  def self.down
    drop_table :code_categories
  end
end
