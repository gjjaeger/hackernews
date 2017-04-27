class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def index
    @links = Link.sort
  end

  def show
    @link = Link.find(params[:id])
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:notice] = "Link successfully added!"
      redirect_to  links_path(@link)
    else
      render :new
    end
  end
  def edit
    @link = Link.find(params[:id])
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to links_path
  end

  def update
    @link= Link.find(params[:id])
    if @link.update(link_params)
      redirect_to links_path
    else
      render :edit
    end
  end

  def vote_up
    @link=Link.find(params[:link_id])
    @link.vote_up()
    @link.save!
    redirect_to link_path(@link)
  end

  private
  def link_params
    params.require(:link).permit(:url, :name)
  end

end
