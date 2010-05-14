class Logins
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/logins$/
      [200, {"Content-Type" => "text/html"}, ["<html><pre>#{%x[who]}</pre></html>"]]
    elsif env["PATH_INFO"] =~ /^\/logins.+$/
      puts "uri: #{NewRelic::Agent::Instrumentation::MetricFrame.current.uri}"
      raise "This is an error with the path!"
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end
  if defined? ::NewRelic
    require 'new_relic/agent/instrumentation/rack'
    extend NewRelic::Agent::Instrumentation::Rack
  end
end 
