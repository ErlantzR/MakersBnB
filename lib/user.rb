require 'pg'

class User

  attr_reader :id, :username

  def initialize(id:, username:)
    @id = id
    @username = username
  end

  def self.create(username:)

    result = DatabaseConnection.query("INSERT INTO users (username) VALUES($1) RETURNING id, username ;", [username])
    User.new(id: result[0]['id'], username: result[0]['username'])
  end

  def self.authenticate(username:)

    result = DatabaseConnection.query("SELECT * FROM users WHERE username = $1", [username])
    if result.any?
      User.new(id: result[0]['id'], username: result[0]['username'])
    else
      nil
    end
  end

  def self.find(id:)

    result = DatabaseConnection.query("SELECT * FROM users WHERE id = ($1);", [id])
    if result.any?
      User.new(id: result[0]['id'], username: result[0]['username'])
    else
      nil
    end
  end

end