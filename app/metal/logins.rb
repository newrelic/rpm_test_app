# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)
require 'new_relic/agent/instrumentation/rack'
class Logins
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/logins/
      [200, {"Content-Type" => "text/html"}, ["<html><pre>#{%x[who]}</pre></html>"]]
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end
  extend NewRelic::Agent::Instrumentation::Rack
end
