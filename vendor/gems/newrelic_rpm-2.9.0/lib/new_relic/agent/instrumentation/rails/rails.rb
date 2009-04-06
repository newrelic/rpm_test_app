# Instrument the compilation of ERB files.
# For developer mode, we subtract compile from total TT time
=begin
ERB::Compiler.class_eval do
  add_method_tracer :compile, 'View/.rhtml Processing'
end
=end

