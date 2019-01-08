function invert(number)
	t = {}
	local i = 1
	while number ~= 0 do
		t[i] = number%10
		number = math.floor(number/10)
		i = i + 1
	end
	local str = ""
	for i = 1, #t do
		str = str .. t[i]
	end
	return str
end

print(invert(1234123434))