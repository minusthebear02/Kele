
require 'httparty'
require 'json'

class Kele
  include HTTParty

  def initialize(email, password)
    @base_uri = 'https://www.bloc.io/api/v1'
    options = {body: {email: email, password: password}}
    response = Kele.post("#{@base_uri}/sessions", options)
    if response && response["auth_token"]
      @auth_token = response["auth_token"]
      puts "#{email} has sucessfully logged in"
    else
      puts "Login invalid"
    end
  end

  def get_me
    response = Kele.get("#{@base_uri}/users/me", headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

end
