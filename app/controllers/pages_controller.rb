class PagesController < ApplicationController
  def index
    @pages = Page.all
  end
  
  def new
   @page = Page.new
  end
   def show
    @page = Page.find(params[:id])
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
  
  def update
    page = Page.find(params[:id])
    page.name = params[:content][:page_name][:value]
    page.content = params[:content][:page_content][:value]
    page.save!
    render text: ""
  end
end
