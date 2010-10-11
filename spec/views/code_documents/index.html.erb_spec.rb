
require File.join(File.dirname(__FILE__), '..', '..', 'spec_helper')

describe "code_documents/index.html.erb" do

  before do
      #@used_languages = ["Java", "Javascript", "Yaml", "Ruby", "Python", "C", "C++", "Ant", "Bash", "Sql", "HTML", "CSS", "Pl/Sql", "Xml"]
      #areas = ["Web", "Database", "Unittest", "Windows", "Linux", "MacOSX", "Redmine", "Misc"]
    @cd1 = Factory(:code_document)
    @cd2 = Factory(:code_document)
    used_languages = {"ruby" => 1}
    assigns[:used_languages] = used_languages
    assigns[:code_documents] = [@cd1, @cd2]
    assigns[:used_areas] = {"Database" => 1}
    assigns[:filter_language_id] = 1
    assigns[:filter_area_id] = 1
  end

  it "displays the menu and a list of two documents" do    
    render
    response.should have_tag("div#dashboard") do
      with_tag("table#index_doc_table") do
        with_tag("td#cd_title_#{@cd1.id}", "#{@cd1.title}")
        with_tag("td#cd_title_#{@cd2.id}", "#{@cd2.title}")
        with_tag("td#cd_author_#{@cd1.id}", "#{@cd1.authorname}")
        with_tag("td#cd_author_#{@cd2.id}", "#{@cd2.authorname}")
        with_tag("td#cd_actions_#{@cd2.id}") do
          with_tag("a", "Edit")
          with_tag("a", "Deleted")
        end
      end
    end
  end

end
