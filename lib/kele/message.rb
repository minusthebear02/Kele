module Message

  def get_messages(page_num = 1)
    response = Kele.get("#{@base_uri}/message_threads", headers: { "authentication" => @auth_token }, body: { "page" => page_num })
    JSON.parse(response.body)
  end

  def create_message(recipient_id, token, subject, body)
    response = Kele.post("#{@base_uri}/messages",
      query: {
        sender: @email,
        recipient_id: recipient_id,
        token: token,
        subject: subject,
        "stripped-text" => body
      },
      headers: {
        authorization: @auth_token
      }
    )

    if response["success"]
      puts "Message has sucessfully sent"
    else
      puts "Message failed to send"
    end
  end
end
