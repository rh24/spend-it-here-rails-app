OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
  #   {
  #     :name => "google",
  #     :scope => "email, profile, plus.me, http://gdata.youtube.com",
  #     :prompt => "select_account",
  #     :image_aspect_ratio => "square",
  #     :image_size => 50
  #   }
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "user:email,user:follow"
end
