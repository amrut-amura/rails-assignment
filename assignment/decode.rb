# require 'rack'e423dcd64e67f4f00e61e1b490be48cb6d027982e13f9c9397eb4fe35f73bd4202c018742cd2fa1a67d5ab1cd89a3a3a994a2b68434ee70b77e95bff309aa8d2
# h =  Rack::Session::Cookie::Base64::Marshal.new.decode(ARGV[0])
# p h
# decode_session_cookie.rb
# ------------------------
# The purpose of this script is to show that if I have the secret_key_base
# and a cookie to an active Rails session, I can decrypt it and gain access
# to key information about the user's session.

require 'rubygems'
# require 'Rails'
require 'cgi'
require 'active_support'

def decrypt_session_cookie(cookie, key)
  cookie = CGI::unescape(cookie)
  
  # Default values for Rails 4 apps
  key_iter_num = 1000
  key_size     = 64
  salt         = "encrypted cookie"         
  signed_salt  = "signed encrypted cookie"  

  key_generator = ActiveSupport::KeyGenerator.new(key, iterations: key_iter_num)
  secret = key_generator.generate_key(salt)
  sign_secret = key_generator.generate_key(signed_salt)

  encryptor = ActiveSupport::MessageEncryptor.new(secret, sign_secret)
  puts encryptor.decrypt_and_verify(cookie)
end


# # Time to test ... (With data from Arbeit327)
	cookie = 'T3I4a3hCZ2U1ZnRtZnNOYTdTeWsvUFE1ZFRibW9oMFY3OCsxTXU2V2JVMmVnUHYyb0hwZnFHbVFFdy9PM2FqaXhrTnB0eTQyZUYxb2lZWi82REo4UkM1dUJDcTRZZTU4TThmdmNzRk1ZU2ZSS1FqNUtLamJZODJIbnBjV21hcy85eGRmR1UySlR4NlJrSGFyZ0dya0MxVW1uUWRtTlVtTEppdWZxWmNnT3ZRPS0tbmFQcjNTTmhoLy9SL0gycWg3anlwQT09--dcdb43da4099796592a2d4b302476682f0672f4a'
key = 'e423dcd64e67f4f00e61e1b490be48cb6d027982e13f9c9397eb4fe35f73bd4202c018742cd2fa1a67d5ab1cd89a3a3a994a2b68434ee70b77e95bff309aa8d2'

decrypt_session_cookie(cookie, key)
# message = CGI.unescape("T3I4a3hCZ2U1ZnRtZnNOYTdTeWsvUFE1ZFRibW9oMFY3OCsxTXU2V2JVMmVnUHYyb0hwZnFHbVFFdy9PM2FqaXhrTnB0eTQyZUYxb2lZWi82REo4UkM1dUJDcTRZZTU4TThmdmNzRk1ZU2ZSS1FqNUtLamJZODJIbnBjV21hcy85eGRmR1UySlR4NlJrSGFyZ0dya0MxVW1uUWRtTlVtTEppdWZxWmNnT3ZRPS0tbmFQcjNTTmhoLy9SL0gycWg3anlwQT09--dcdb43da4099796592a2d4b302476682f0672f4a")

# config = Rails.application.config

# key_generator = ActiveSupport::KeyGenerator.new(
#   config.secret_key_base, iterations: 1000
# )

# secret = key_generator.generate_key(
#   config.action_dispatch.encrypted_cookie_salt
# )

# sign_secret = key_generator.generate_key(
#   config.action_dispatch.encrypted_signed_cookie_salt
# )

# encryptor = ActiveSupport::MessageEncryptor.new(
#   secret, sign_secret
# )

# encryptor.decrypt_and_verify(message)