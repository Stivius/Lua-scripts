function primes50()
	local count = 0
	local i = 1
	while true do
		if count == 50 then break; end
		local c = 0
		for j = 1, i do
			if i%j == 0 and j ~= 1 and j ~= i then c = c + 1; break; end
		end
		if c == 0 then print(i); count = count + 1 end
		i = i + 1
	end
end




primes50()