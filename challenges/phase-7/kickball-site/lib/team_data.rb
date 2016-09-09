require "json"

class TeamData
  class << self
    def to_h
      JSON.parse(json_document)
    end

    private

    def json_file
      File.join(File.dirname(__FILE__), "..", "data", "roster.json")
    end

    def json_document
      IO.read(json_file)
    end
  end
end
