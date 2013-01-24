class DislikesController < ApplicationController
  # GET /dislikes
  # GET /dislikes.json
  def index
    @dislikes = Dislike.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dislikes }
    end
  end

  # GET /dislikes/1
  # GET /dislikes/1.json
  def show
    @dislike = Dislike.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dislike }
    end
  end

  # GET /dislikes/new
  # GET /dislikes/new.json
  def new
    @dislike = Dislike.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dislike }
    end
  end

  # GET /dislikes/1/edit
  def edit
    @dislike = Dislike.find(params[:id])
  end

  # POST /dislikes
  # POST /dislikes.json
  def create
    @dislike = Dislike.new(:comment_id => params[:comment_id], :user_id => current_user.id)

    respond_to do |format|
      if @dislike.save
        format.html { redirect_to :back, notice: 'Dislike was successfully created.' }
#        format.json { render json: @dislike, status: :created, location: @dislike }
#      else
#        format.html { render action: "new" }
#        format.json { render json: @dislike.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dislikes/1
  # PUT /dislikes/1.json
  def update
    @dislike = Dislike.find(params[:id])

    respond_to do |format|
      if @dislike.update_attributes(params[:dislike])
        format.html { redirect_to @dislike, notice: 'Dislike was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dislike.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dislikes/1
  # DELETE /dislikes/1.json
  def destroy
    @dislike = Dislike.find(params[:id])
    @dislike.destroy

    respond_to do |format|
      format.html { redirect_to dislikes_url }
      format.json { head :no_content }
    end
  end
end
