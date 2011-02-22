require 'new_relic/agent/method_tracer'
Post.class_eval do
  include NewRelic::Agent::MethodTracer
  add_method_tracer :evaluate, 'Custom/Post/evaluate'
  end
