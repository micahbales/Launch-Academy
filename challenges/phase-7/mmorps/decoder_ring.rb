require "uri"
require "openssl"

def decode_session(str)
  Marshal.load(URI.decode_www_form_component(str).unpack("m").first)
end

def generate_hmac(data, secret)
  OpenSSL::HMAC.hexdigest(OpenSSL::Digest::SHA1.new, secret, data)
end

encoded_cookie_string = "BAh7C0kiD3Nlc3Npb25faWQGOgZFVEkiRTMzMjYzNGM4OGIyZWY3ODgyNjUy%0AY2MwOTg1NzA4M2U3NTNkMGQzOTg3YjgzZmJjZTI3ZDE1ZGYwMWNkZWIzYjEG%0AOwBGSSISY29tcHV0ZXJfd2lucwY7AEZpBkkiDnVzZXJfd2lucwY7AEZpBkki%0ADG1lc3NhZ2UGOwBGSSITQ29tcHV0ZXIgd2lucyEGOwBUSSIScGxheWVyX2No%0Ab2ljZQY7AEZJIglyb2NrBjsAVEkiFGNvbXB1dGVyX2Nob2ljZQY7AEZJIgpw%0AYXBlcgY7AFQ%3D%0A"
decoded_cookie_string = decode_session(encoded_cookie_string)
hacker_hmac = generate_hmac(decoded_cookie_string, "keep_it_secret_keep_it_safe")

puts hacker_hmac
