require 'specgen'

task default: %w[test]

task :generate_code do
  specgen_client_ruby(spec_file: "spec.yaml", generate_path: "./lib")
end

task :test => :generate_code do
  FileUtils.mkdir_p "./test-results"
  ruby "-Ilib:test test/*_test.rb --runner=junitxml --junitxml-output-file=./test-results/junit.xml"
end