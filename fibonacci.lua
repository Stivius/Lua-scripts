function fibonacci(number)
	if number >= 2 then
		local t = {0,1}
		while #t < number do
			t[#t + 1] = t[#t-1] + t[#t]
		end
		return t[#t]
	elseif number == 1 then print(0) end
end


print(fibonacci(7))