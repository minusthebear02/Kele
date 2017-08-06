  require 'httparty'
  require 'json'
  require 'kele/roadmap'
  require 'kele/message'
  require 'kele/checkpoint'

  class Kele
    include HTTParty
    include Roadmap
    include Message
    include Checkpoint

    def initialize(email, password)
      @base_uri = 'https://www.bloc.io/api/v1'
      @email = email
      options = {body: {email: @email, password: password}}
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

    def get_mentor_availability(mentor_id)
      response = Kele.get("#{@base_uri}/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @auth_token })
      JSON.parse(response.body)
    end

  end
