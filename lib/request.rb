class Request

  attr_reader :space_id, :sender_id, :message, :status, :id

  def initialize(id:, space_id:, sender_id:, status:, message:)
    @id = id
    @space_id = space_id
    @sender_id = sender_id
    @status = status
    @message = message
  end

  def self.create(space_id:, sender_id:, message:, status: 'pending')
    result = DatabaseConnection.query(
      "INSERT INTO requests (space_id, sender_id, message, status) VALUES($1, $2, $3, $4) RETURNING id, space_id, sender_id, message, status;",
    [space_id, sender_id, message, status])
    Request.new(id: result[0]['id'], space_id: result[0]['space_id'], sender_id: result[0]['sender_id'], message: result[0]['message'], status: result[0]['status'])
  end

  def self.find_by_host(host_id:)
    
    result = DatabaseConnection.query("SELECT * FROM requests WHERE space_id IN (SELECT id FROM spaces WHERE user_id = $1);",[host_id])
    result.map do |request|
      Request.new(id: request['id'], space_id: request['space_id'], sender_id: request['sender_id'], status: request['status'], message: request['message']) 
    end 
  end

  def self.find_by_guest(guest_id:)
    
    result = DatabaseConnection.query("SELECT * FROM requests WHERE sender_id = $1;",[guest_id])
    result.map do |request|
      Request.new(id: request['id'], space_id: request['space_id'], sender_id: request['sender_id'], status: request['status'], message: request['message']) 
    end 
  end

  def self.accept(request_id:)

    DatabaseConnection.query("UPDATE requests SET status = 'accepted' WHERE id = $1;", [request_id])
  end

  def self.reject(request_id:)

    DatabaseConnection.query("UPDATE requests SET status = 'rejected' WHERE id = $1;", [request_id])
  end
end
