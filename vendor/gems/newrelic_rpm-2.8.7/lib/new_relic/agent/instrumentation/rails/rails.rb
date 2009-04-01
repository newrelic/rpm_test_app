# Instrument the compilation of ERB files. 
ERB::Compiler.class_eval do
#  add_method_tracer :compile, 'View/ERB Compilation', :metric => false
end


