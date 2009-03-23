class CodeDocumentsController < ApplicationController
  unloadable

  before_filter :get_user
  
  def index
    @code_documents = CodeDocument.find(:all)
    l = {}
    a = {}
    @code_documents.each do |cd|
      l.key?(cd.code_language.id)? l[cd.code_language.id] += 1 : l[cd.code_language.id] = 1
      a.key?(cd.code_area.id)? a[cd.code_area.id] += 1 : a[cd.code_area.id] = 1
    end
    @used_languages = {"All (#{l.keys.size})" => 0} 
    CodeLanguage.find(l.keys).collect{|cl| @used_languages["#{cl.name} (#{l[cl.id]})"] = cl.id}.sort
    @used_areas = {"All (#{a.keys.size})" => 0}
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