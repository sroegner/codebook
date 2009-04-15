class CodeDocumentsController < ApplicationController
  unloadable

  before_filter :get_user
  
  def index
    all_code_documents = CodeDocument.find(:all)
    @filter_area_id = params[:area_id].to_i || 0 
    @filter_language_id = params[:language_id].to_i || 0

    if(@filter_area_id > 0 or @filter_language_id > 0)
      @code_documents = CodeDocument.find(:all, :conditions => ['code_language_id = ?', @filter_language_id]) if @filter_area_id == 0
      @code_documents = CodeDocument.find(:all, :conditions => ['code_area_id = ?', @filter_area_id]) if @filter_language_id == 0
      @code_documents = CodeDocument.find(:all, :conditions => ['code_language_id = ? and code_area_id = ?', @filter_language_id,@filter_area_id]) if @filter_language_id > 0 and @filter_area_id > 0 
    else
      @code_documents = all_code_documents
    end
    l = {} 
    a = {}
    all_code_documents.each do |cd|
      l.key?(cd.code_language.id)? l[cd.code_language.id] += 1 : l[cd.code_language.id] = 1
      a.key?(cd.code_area.id)? a[cd.code_area.id] += 1 : a[cd.code_area.id] = 1
    end
    @used_languages = {"All (#{l.keys.size})" => 0}
    @used_areas = {"All (#{a.keys.size})" => 0}
    CodeLanguage.find(l.keys).collect{|cl| @used_languages["#{cl.name} (#{l[cl.id]})"] = cl.id}.sort
    CodeArea.find(a.keys).collect{|ca| @used_areas["#{ca.name} (#{a[ca.id]})"]= ca.id}.sort
  end

  def new
    @code_document = CodeDocument.new()
  end

  def search
    @srchterm = params[:searchterm]
    @code_documents = CodeDocument.find(:all, :conditions => ['title like ?', @srchterm])
    render :action => "index"
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
    @show_line_numbers = params[:show_line_numbers] || '0'
  end

private

  def get_user
    render_403 unless User.current.logged?
    
    if params[:user_id] && params[:user_id] != User.current.id.to_s
      @user = User.find(params[:user_id])
    else
      @user = User.current  
    end
  end

end