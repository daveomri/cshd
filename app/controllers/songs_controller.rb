# Songs controller
class SongsController < ApplicationController
  before_action :set_song, only: %i[ show edit update destroy ]

  # GET /songs or /songs.json
  def index
    if params[:search]
      search_songs
    else
      @songs = Song.order(params[:sort])
    end
  end

  # Method searchs for given song
  # if no song is found, user is noticed
  def search_songs
    if @song = Song.all.find { |song|
      song.name.include?(params[:search])
    }
      redirect_to song_path(@song)
    else
      respond_to do |format|
        format.html { redirect_to songs_url, notice: 'Song not found' }
        format.json { head :no_content }
      end
    end
  end

  # GET /songs/1 or /songs/1.json
  def show
    # empty
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
    # empty
  end

  # POST /songs or /songs.json
  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to song_url(@song), notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1 or /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to song_url(@song), notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1 or /songs/1.json
  def destroy
    @song.destroy

    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_song
    @song = Song.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def song_params
    params.require(:song).permit(:name, :info, :released, :language_id, :artist_id, :song_url)
  end
end
