require "test_helper"

class ArtistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artist = artists(:one)
  end

  test 'should get index' do
    get artists_url
    assert_response :success
  end

  test 'should get new' do
    get new_artist_url
    assert_response :success
  end

  test 'should create artist' do
    assert_difference('Artist.count') do
      post artists_url, params: { artist: { bio: @artist.bio, birth_date: @artist.birth_date, first_name: @artist.first_name, state_id: @artist.state_id, last_name: @artist.last_name, nickname: @artist.nickname, pic_url: @artist.pic_url } }
    end

    assert_redirected_to artist_url(Artist.last)
  end

  test 'should show artist' do
    get artist_url(@artist)
    assert_response :success
  end

  test 'should get edit' do
    get edit_artist_url(@artist)
    assert_response :success
  end

  test 'should update artist' do
    patch artist_url(@artist), params: { artist: { bio: @artist.bio, birth_date: @artist.birth_date, first_name: @artist.first_name, state_id: @artist.state_id, last_name: @artist.last_name, nickname: @artist.nickname, pic_url: @artist.pic_url } }
    assert_redirected_to artist_url(@artist)
  end

  test 'should destroy artist' do
    assert_difference('Artist.count', -1) do
      delete artist_url(@artist)
    end

    assert_redirected_to artists_url
  end
end
