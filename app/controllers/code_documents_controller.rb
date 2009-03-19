class CodeDocumentsController < ApplicationController
  unloadable

  before_filter :get_user
  
  def index
    @code_documents = CodeDocument.find(:all)
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