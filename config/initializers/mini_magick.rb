MiniMagick.configure do |config|
    config.cli = :imagemagick  # Use :graphicsmagick if you have GraphicsMagick installed
    # Optionally set the path if ImageMagick is in a non-standard location
    # config.path = '/usr/local/bin'
  end
  