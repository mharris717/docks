module Docks
  class Parser
    include FromHash
    attr_accessor :filename, :list
    fattr(:body) do
      open(filename).read
    end
    fattr(:lines) do
      body.split("\n").map { |x| Line.new(:raw => x, :parser => self) }
    end
    def to_s
      lines.join("\n")
    end
  end
end