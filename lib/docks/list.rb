module Docks
  class List
    fattr(:hash) do
      res = {}
      path = File.dirname(__FILE__) + "/../../defs/**/*.yml"
      path = File.expand_path(path)
      Dir[path].each do |f|
        res = res.merge(add_file(f))
      end
      res
    end

    def add_file(f)
      from_yaml = YAML::load(File.read(f))
      handle_yaml_hash(from_yaml)
    end

    def expand_dock_path(path)
      if path =~ /http/i
        path
      else
        dir = File.expand_path(File.dirname(__FILE__)+"/../../dockerfiles")
        "#{dir}/#{path}"
      end
    end

    def handle_yaml_hash(from_yaml,prefixes=[])
      res = {}
      from_yaml.each do |k,v|
        if v.kind_of?(Hash)
          temp = handle_yaml_hash v, prefixes+[k]
          res = res.merge(temp)
        else
          full_key = (prefixes+[k]).join("/")
          res[full_key] = expand_dock_path(v)
        end
      end
      res
    end

    def body(name)
      url = hash[name].tap { |x| raise "nothing for #{name}" unless x }
      open(url).read
    end
  end
end