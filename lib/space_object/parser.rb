module SpaceObject
  class Parser
    DELIMITER = /\n(?! )/
    LEAF = /^([^ ]+) /
    KEY_LINE = /^([^ ]+)(\n|$)/
    NEST_SPACING = /\n /

    def initialize(document)
      @document = (document || '')
    end

    def parse
      prepare_string
      parse_string(@document)
    end

    private
    def prepare_string
      @document =  @document.strip.gsub(/(\r\n|\n\r|\n\n+)/, "\n")
    end

    def populate_space(space, str)
    end

    def parse_string(str)
      str.split(DELIMITER).inject(Base.new) do |obj, space|
        key, value = if matches = KEY_LINE.match(space)
          offset = matches[1].length
          [matches[1], parse_string(space[offset..-1].gsub(NEST_SPACING, "\n"))]
        elsif matches = LEAF.match(space)
          offset = matches[1].length + 1
          [matches[1], space[offset..-1].gsub(NEST_SPACING, "\n")]
        end
        (key.nil? || key.empty?) or obj[key] = value
        obj
      end
    end
  end
end