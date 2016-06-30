Rails.application.config.middleware.use OmniAuth::Builder do
  #separate staging and production logins (also debug)
  if Rails.env.development?
    provider :facebook, '1099941930077096', 'b0c1ded4a34c3a13b98b8505466ae628',
    scope: 'public_profile', info_fields: 'id,name,link'
  elsif Rails.env.production?
    provider :facebook, 'PRODUCTION_APP_ID', 'PRODUCTION_APP_SECRET'
  end
  

  OmniAuth.config.on_failure = Proc.new do |env|
    SessionsController.action(:auth_failure).call(env)
    # error_type = env['omniauth.error.type']
    # new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{error_type}"
    # [301, {'Location' => new_path, 'Content-Type' => 'text/html'}, []]
  end
  
end