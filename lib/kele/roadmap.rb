
module Roadmap

    def get_roadmap(roadmap_id)
      response = Kele.get("#{@base_uri}/roadmaps/#{roadmap_id}")
      JSON.parse(response.body)
    end

    def get_checkpoint(checkpoint_id)
      response = Kele.get("#{@base_uri}/checkpoints/#{checkpoint_id}")
      JSON.parse(response.body)
    end

  def create_submission(assignment_branch, assignment_commit_link, checkpoint_id, comment, enrollment_id)
    response = Kele.post("#{@base_uri}/checkpoint_submissions",
      query: {
        assignment_branch: assignment_branch,
        assignment_commit_link: assignment_commit_link,
        checkpoint_id: checkpoint_id,
        comment: comment,
        enrollment_id: enrollment_id
      },
      headers: {
        authorization: @auth_token
      }
    )

    if response["status"] == "submitted"
      puts "Submission Successful"
    else
      puts "Submission Unsuccessful, please try again"
    end
  end

end
