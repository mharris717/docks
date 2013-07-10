require 'yaml'
require 'mharris_ext'
require 'open-uri'
require 'fileutils'

%w(list parser line build).each do |f|
  load File.expand_path(File.dirname(__FILE__))+"/docks/#{f}.rb"
end

module Docks
  class << self
    def parsed(file)
      parser = Parser.new(:filename => file, :list => List.new)
      parser.to_s
    end
    def build(file,ops_str)
      Build.new(:filename => file, :ops_str => ops_str).build!
    end
  end
end