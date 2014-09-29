class PagesController < ApplicationController
  def index
    @pages = Page.all
  end
  
  def new
   @page = Page.new
  end

  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @page = Page.find(params[:id])
  end

  def slug
    @page = Page.find_by_name(params[:path])
  end
  
  def update
    page = Page.find(params[:id])
    page.name = params[:content][:page_name][:value]
    page.content = params[:content][:page_content][:value]
    page.save!
    render text: ""
  end
end
