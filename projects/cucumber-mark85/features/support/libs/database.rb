require 'bcrypt'
require 'mongo'

class Database
  def initialize
    Mongo::Logger.logger.level = Logger::WARN
    @client = Mongo::Client.new(mongo_uri, client_options)
    @users = @client[:users]
  end

  def delete_all_users
    result = @users.delete_many
    puts "removing all users: #{result.deleted_count} removed"
  end
  alias apagar_todos_usuarios delete_all_users

  def insert_user(user_data)
    name = user_data['name']
    email = user_data['email']
    password = user_data['password']

    @users.insert_one(
      name: name,
      email: email,
      password: BCrypt::Password.create(password, cost: 8).to_s
    )

    puts "inserting user: #{name} | #{email}"
  end
  alias inserir_usuario insert_user

  private

  def client_options
    return {} if mongo_uri_has_database?

    { database: mongo_database }
  end

  def mongo_uri
    value = ENV['MONGO_URI'] || env_value_from_api_env('MONGO_URI') || raise('MONGO_URI nao configurada')

    value.sub(/\?+\z/, '')
  end

  def mongo_database
    ENV['MONGO_DATABASE'] || env_value_from_api_env('MONGO_DATABASE') || 'mark85'
  end

  def mongo_uri_has_database?
    uri_without_query = mongo_uri.split('?', 2).first
    path = uri_without_query.split('.mongodb.net', 2).last

    path && path != '/' && !path.empty?
  end

  def env_value_from_api_env(env_key)
    env_path = File.expand_path('../../../../../apps/mark85/api/.env', __dir__)
    return unless File.exist?(env_path)

    File.readlines(env_path).each do |line|
      key, value = line.strip.split('=', 2)
      return value if key == env_key && value && !value.empty?
    end

    nil
  end
end
