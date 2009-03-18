class CreateCodeDocuments < ActiveRecord::Migration
  def self.up
    create_table :code_documents do |t|
      t.integer :id
      t.string :title, :limit => 60
      t.text :description
      t.text :code
      t.integer :category_id
      t.integer :language_id
      t.integer :author_id
      t.timestamps
    end
  end

  def self.down
    drop_table :code_documents
  end
end
