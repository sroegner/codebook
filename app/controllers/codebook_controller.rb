class CodebookController < ApplicationController
  unloadable

  before_filter :get_user
  
  def index
    @code_documents = CodeDocument.find(:all)
  end

  def admin
    @languages = CodeLanguage.ordered
    @areas = CodeArea.ordered
    @area = CodeArea.new
    @language = CodeLanguage.new
  end
  
  def new
    @code_document = CodeDocument.new()
  end

  def create
    params[:code_document][:author_id] = @user.id
    @doc = CodeDocument.new(params[:code_document])
    if @doc.save
      flash.now[:notice] = 'Your Code Document was successfully created.'
      redirect_to :action => :index
    else
      render :action => "new"
    end
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

  def edit
    @code_document = CodeDocument.find(params[:id])
  end
  
  def update
    params[:code_document][:author_id] = @user.id
    @code_document = CodeDocument.find(params[:id])
    if @code_document.update_attributes(params[:code_document])
      redirect_to :action => "show", :id => @code_document
    else
      render :action => "edit"
    end
  end

  def destroy
    @code_document = CodeDocument.find(params[:id])
    flash.now[:error] = "Cannot delete code document" unless @code_document.destroy
    redirect_to :action => :index
  end

  def show
    @code_document = CodeDocument.find(params[:id])
    @parsed = parse_coderay(@code_document.code)
  end

  def parse_coderay(text)
    text.scan(/(<code\:([a-z].+?)>(.+?)<\/code>)/m).each do |match|
      text.gsub!(match[0],CodeRay.scan(match[2], match[1].to_sym).div( :line_numbers => :table,:css => :class))
    end
    text
  end

  def find
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
