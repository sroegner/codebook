class CodebookController < ApplicationController
  unloadable

  before_filter :get_user
  
  def index
    redirect_to code_documents_path
  end

  def admin
    @languages = CodeLanguage.ordered
    @areas = CodeArea.ordered
    @area = CodeArea.new
    @language = CodeLanguage.new
  end
  
  
  def create_category
    if params[:code_language]
      newcat = "CodeLanguage".constantize.new(params[:code_language])
    elsif params[:code_area]
      newcat = "CodeArea".constantize.new(params[:code_area])
    else
      newcat = nil
    end
    
    if newcat and newcat.save
      flash.now[:notice] = '#{newcat.name} was successfully created.'
    else
      flash.now[:error] = 'Cannot create that category'
    end
    redirect_to :action => 'admin'
  end

  def destroy_category
    if params[:language_id]
      "CodeLanguage".constantize.find(params[:language_id]).destroy
    elsif params[:area_id]
      "CodeArea".constantize.find(params[:area_id]).destroy
    end
    
    redirect_to :action => 'admin'
  end

  def get_user
    render_403 unless User.current.logged?
    
    if params[:user_id] && params[:user_id] != User.current.id.to_s
      @user = User.find(params[:user_id])
    else
      @user = User.current  
    end
  end
  
  def add_default_enums
    langs = ["Java", "Ruby", "Python", "C", "C++", "Ant", "Bash", "Sql", "Pl/Sql"]
    areas = ["Web", "Database", "Unittest", "Windows", "Linux", "Misc"]

    if CodeLanguage.find(:all).size == 0
      langs.each do |l| 
        new_l = CodeLanguage.create(:name => l)
        new_l.save
      end
    end

    if CodeArea.find(:all).size == 0
      areas.each do |a| 
        new_a = CodeArea.create(:name => a)
        new_a.save
      end
    end
    redirect_to :action => 'admin'
  end

end
