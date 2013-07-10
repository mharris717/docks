module Docks
  class Build
    include FromHash
    attr_accessor :filename, :ops_str
    fattr(:temp_dir) do
      res = "/tmp/docks_#{rand(100000000000000)}"
      FileUtils.mkdir res
      res
    end
    def build!
      parsed = Docks.parsed(filename)
      File.create "#{temp_dir}/Dockerfile",parsed

      cmd = "docker build #{ops_str} #{temp_dir}"
      puts cmd
      exec cmd unless ops_str.to_s =~ /--mock/
    end
  end
end