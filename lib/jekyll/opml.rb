require "jekyll/opml/version"

require 'opml'
require 'liquid'

module Jekyll
  module OpmlConverter < Converter
    safe true
    
    priority :low
    
    def matches(ext)
      ext =~ /opml/i
    end
    
    def output_ext(ext)
      ".html"
    end
    
    def convert(content)
      content
    end
  end
  
  module Filters
    def restify(input)
      site = @content.registers[:site]
      converter = site.getConverterImpl(Jekyll::OpmlConverter)
      converter.convert(input)
    end
  end
  
  class Post
    alias :_orig_read_yaml :read_yaml
    def read_yaml(base, name, opts={})
      if name !~ /[.]opml$/
        return _orig_read_yaml(base, name)
      end
      
      content = File.read(File.join(base, name), merged_file_read_opts(opts))
      self.data ||= {}
      liquid_enabled = false;
      
      opml_text = Opml.new(content)
      
      if buffer_setting == 'liquid'
        liquid_enabled = true
      end
      
      if liquid_enabled
        
end
