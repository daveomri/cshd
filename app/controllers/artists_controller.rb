# Artist controller
class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[ show edit update destroy ]

  # GET /artists or /artists.json
  def index
    if params[:search]
      search_artists
    else
      @artists = Artist.order(params[:sort])
    end
  end

  # Method searchs for given artist
  # if no artist is found, user is noticed
  def search_artists
    if @artist = Artist.all.find { |artist|
      artist.nickname.include?(params[:search])
    }
      redirect_to artist_path(@artist)
    else
      respond_to do |format|
        format.html { redirect_to artists_url, notice: 'Artist not found' }
        format.json { head :no_content }
      end
    end
  end

  # GET /artists/1 or /artists/1.json
  def show
    # empty
  end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
    # empty
  end

  # POST /artists or /artists.json
  def create
    @artist = Artist.new(artist_params)

    respond_to do |format|
      if @artist.save
        format.html { redirect_to artist_url(@artist), notice: 'Artist was successfully created.' }
        format.json { render :show, status: :created, location: @artist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artists/1 or /artists/1.json
  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to artist_url(@artist), notice: 'Artist was successfully updated.' }
        format.json { render :show, status: :ok, location: @artist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1 or /artists/1.json
  def destroy
    @artist.destroy

    respond_to do |format|
      format.html { redirect_to artists_url, notice: 'Artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_artist
    @artist = Artist.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def artist_params
    params.require(:artist).permit(:nickname, :first_name, :last_name, :pic_url, :birth_date, :state_id, :bio)
  end
end
