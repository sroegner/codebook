class CreateCodeDocuments < ActiveRecord::Migration
  def self.up
    create_table :code_documents do |t|
      t.column :title, :string
      t.column :description, :text
      t.column :code, :text
      t.column :category_id, :integer
      t.column :language_id, :integer
      t.column :author_id, :integer
    end
  end

  def self.down
    drop_table :code_documents
  end
end
