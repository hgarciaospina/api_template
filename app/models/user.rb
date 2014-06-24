class User < ActiveRecord::Base

  DEFAULT_API_RPM =  10

  before_create do |doc|
    doc.api_key = User.generate_api_key
    doc.api_rpm = DEFAULT_API_RPM if doc.api_rpm == 0
  end

  def self.generate_api_key
    loop do
      token = SecureRandom.base64.tr('0+/=', 'bRat')
      break token unless User.exists?(user_token: token)
    end
  end
  
end
