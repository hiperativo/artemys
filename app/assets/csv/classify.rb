require "smarter_csv"
@lojas_venezuela = SmarterCSV.process "lojas-venezuela.csv", { col_sep:';'}
def classify
	@states, @cities = {}
	for store in @lojas_venezuela
		unless @states[store[:state]]
			@states[store[:state]] = {}
			unless @states[store[:state]][store[:city]]
				@states[store[:state]][store[:city]] = {}
			end
		end
		@states[store[:state]][store[:city]] = store
	end
	return @states
end

puts classify