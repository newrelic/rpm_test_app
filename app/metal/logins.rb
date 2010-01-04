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
