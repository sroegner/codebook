class CreateCodeCategories < ActiveRecord::Migration
  def self.up
    create_table :code_categories do |t|
      t.column :type, :string
      t.column :name, :string
    end

    # not particularly good style, but good enough for now
    langs = ["Java", "Ruby", "Python", "C", "C++", "Ant", "Bash", "Sql", "HTML", "CSS", "Pl/Sql"]
    areas = ["Web", "Database", "Unittest", "Windows", "Linux", "MacOSX", "Misc"]
    langs.sort.each { |l| CodeLanguage.create(:name => l) }
    areas.sort.each { |a| CodeArea.create(:name => a) }
  end

  def self.down
    drop_table :code_categories
  end
end
