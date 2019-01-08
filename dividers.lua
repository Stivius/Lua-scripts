function dividers(number)
	for i = 1, number do
		if number%i == 0 then print(i) end
	end
end

print(dividers(1000))