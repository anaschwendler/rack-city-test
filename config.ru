# frozen_string_literal: true

# App definition
class Application
  def call(env)
    puts inspect_env(env)
    status = 200
    headers = { 'Content-Type' => 'text/html' }
    body = ["I'm learning how to use Rack"]

    [status, headers, body]
  end

  def inspect_env(env)
    puts "Request headers: \n #{request_headers(env)}"
    puts "Server info: \n #{server_info(env)}"
    puts "Rack info: \n #{rack_info(env)}"
  end

  def request_headers(env)
    env.select { |key, _value| key.include?('HTTP_') }
  end

  def server_info(env)
    env.reject { |key, _value| key.include?('HTTP_') or key.include?('rack.') }
  end

  def rack_info(env)
    env.select { |key, _value| key.include?('rack.') }
  end

  def format(heading, pairs)
    [heading, '', format_pairs(pairs), "\n"].join("\n")
  end

  def format_pairs(pairs)
    pairs.map { |key, value| '  ' + [key, value.inspect].join(': ') }
  end
end

run Application.new
