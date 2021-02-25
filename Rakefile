require 'specgen'

task default: %w[test]

task :generate_code do
  specgen_client_ruby(spec_file: "spec.yaml")
end

task :test => :generate_code do
  ruby "-Ilib:test test/*_test.rb --runner=junitxml --junitxml-output-file=junit.xml"
end