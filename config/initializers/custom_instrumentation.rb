Post.class_eval do
  add_method_tracer :evaluate, 'Custom/Post/evaluate'
end
