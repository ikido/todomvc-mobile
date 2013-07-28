#Use this file to set/override Jasmine configuration options
#You can remove it if you don't need it.
#This file is loaded *after* jasmine.yml is interpreted.
#
#Example: using a different boot file.

Jasmine.configure do |config|
  config.boot_dir = File.dirname(__FILE__)
  config.boot_files = lambda { [] }
end


# helper class, which will be loaded to erb,
# to aid with rendering custom jasmine runner script
module JasmineSpecHelpers
  
  def jasmine_spec_file_urls

    # load all spec files in 'spec' subfoler, currently without parsing any support
    # for organizing the into further subfolders
    files = Dir.glob(File.join(Jasmine.config.spec_dir, 'spec', '*.js.coffee'))
    spec_files = files.map {|f| f.gsub(Jasmine.config.spec_dir, '/__spec__').gsub(".coffee", "") }
    
    return spec_files
  end
  
end