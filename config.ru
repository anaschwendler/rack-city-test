# frozen_string_literal: true

# App definition
class Application
  def call(_env)
    status = 200
    headers = { 'Content-Type' => 'text/html' }
    body = ["I'm learning how to use Rack"]

    [status, headers, body]
  end
end

run Application.new
