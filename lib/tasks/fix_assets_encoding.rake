# https://gist.github.com/1301199/

def assets_with_encoding_problems
  results = {}
  paths = ["app/assets", "lib/assets", "vendor/assets"]
  paths.each do |path|
    Dir[Rails.root + path + "**" + "*.{js,css}"].each do |file|
      # make sure we're not trying to process a directory
      raise "directory bad named: #{file} " if File.directory?(file)
      # read the file and check its encoding
      data = File.read(file)
      results[file] = data unless data.valid_encoding?
    end if Rails.root.+(path).directory?
  end
  results
end

def fix_encoding(file, data)
  result = data.encode "UTF-8", "ISO-8859-15", universal_newline: true
  File.open file, "w:utf-8" do |file|
    file.puts result
  end if result.valid_encoding?
  puts "#{file} was transcoded correctly" if File.read(file).valid_encoding?
end

namespace :assets do
  desc "Check that all assets have valid encoding"
  task :check => :environment do
    assets_with_encoding_problems.each do |file, data|
      puts "#{ file } does not have valid encoding!"
      puts "trying to transcode"
      fix_encoding(file, data)
    end
  end
end

