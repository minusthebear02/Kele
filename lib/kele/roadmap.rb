
module Roadmap

    def get_roadmap(roadmap_id)
      response = Kele.get("#{@base_uri}/roadmaps/#{roadmap_id}")
      JSON.parse(response.body)
    end

    def get_checkpoint(checkpoint_id)
      response = Kele.get("#{@base_uri}/checkpoints/#{checkpoint_id}")
      JSON.parse(response.body)
    end

end
