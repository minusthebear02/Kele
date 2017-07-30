
module Roadmap

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

    def get_roadmap(roadmap_id)
      response = Kele.get("#{@base_uri}/roadmaps/#{roadmap_id}")
      JSON.parse(response.body)
    end

    def get_checkpoint(checkpoint_id)
      response = Kele.get("#{@base_uri}/checkpoints/#{checkpoint_id}")
      JSON.parse(response.body)
    end

end
