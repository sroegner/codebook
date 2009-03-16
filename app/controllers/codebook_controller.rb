class CodebookController < ApplicationController
  unloadable

  before_filter :get_user
  
  def index
    @snippets = CodeDocument.find(:all)
    @languages = CodeLanguage.find(:all) || []
    @areas = CodeArea.find(:all) || []

  end

  def admin
    @languages = CodeLanguage.find(:all, :order => 'name ASC')
    @areas = CodeArea.find(:all, :order => 'name ASC')
    @area = CodeArea.new
    @language = CodeLanguage.new
  end
  
  def new
    @code_document = CodeDocument.new()
    @languages = CodeLanguage.find(:all, :order => 'name ASC')
  end

  def create
    
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

  def update
  end

  def destroy
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

end
