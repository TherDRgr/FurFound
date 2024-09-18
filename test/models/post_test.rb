require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @post = posts(:one)
  end

  test "should save valid post" do
    post = Post.new(name: 'Missing Cat', color: 'White', species: 'Cat', breed: 'Persian', last_seen_location: 'Backyard', date_reported: Date.today, user: users(:one))
    assert post.save
  end

  test "should not save post without name" do
    post = Post.new(color: 'White', species: 'Cat', breed: 'Persian', last_seen_location: 'Backyard', date_reported: Date.today)
    assert_not post.save
  end

  test "should generate correct qr_code_url" do
    expected_url = "https://api.qrserver.com/v1/create-qr-code/?data=Name:%20#{URI.encode(@post.name)},%20Species:%20#{URI.encode(@post.species)},%20Last%20Seen:%20#{URI.encode(@post.last_seen_location)},%20Date:%20#{URI.encode(@post.date_reported.to_s)}&size=150x150"
    assert_equal expected_url, @post.qr_code_url
  end
end
