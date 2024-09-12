Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://127.0.0.1:3000' , 'http://localhost:3000'  # You can restrict this to specific domains
    resource '*',
      headers: :any,
      methods: [:get, :post, :options, :put, :delete],
      expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
      max_age: 600,
      credentials: true  # This allows cookies to be sent for authentication
  end
end
