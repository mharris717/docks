module Docks
  class Line
    include FromHash
    attr_accessor :raw, :parser
    def dock?
      raw =~ /^DOCK /i
    end
    def to_s
      dock? ? to_s_dock : raw
    end
    def to_s_dock
      parser.list.body(dock_name)
    end
    def dock_name
      raise 'foo' unless raw =~ /^DOCK (.+)$/
      $1.strip
    end
  end
end