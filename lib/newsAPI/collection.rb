module NewsAPI
	class Collection
		attr_reader :data, :totalResults

		def self.from_response(response, key:, type:)
			body = response.body
			new(
				data: body[key].map { |attrs| type.new(attrs) },
				totalResults: if body.dig("totalResults") then body.dig("totalResults") else body[key].length end
			)
		end

		def initialize(data:, totalResults:)
			@data = data
			@totalResults = totalResults
		end
	end
end
