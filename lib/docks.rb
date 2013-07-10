require 'yaml'
require 'mharris_ext'
require 'open-uri'

%w(list parser line).each do |f|
  load File.expand_path(File.dirname(__FILE__))+"/docks/#{f}.rb"
end

module Docks
  class << self
    def parsed(file)
      parser = Parser.new(:filename => file, :list => List.new)
      parser.to_s
    end
  end
end