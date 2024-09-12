# Rails.application.config.middleware.use OmniAuth::Builder do
#     provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {
#       scope: 'email,profile,openid',
#       prompt: 'consent',
#       access_type: 'offline',
#       setup: lambda { |env|
#         request = Rack::Request.new(env)
#         env['omniauth.strategy'].options['token_params'] = { redirect_uri: "#{request.base_url}/users/auth/google_oauth2/callback" }
#       }
#     }
# end