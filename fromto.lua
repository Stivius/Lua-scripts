function fromto(min, max)
	local current = min - 1
	return function ()
		if current ~= max then
			current = current + 1
			return current
		end
	end
end

for i in fromto(1,5) do
	print(i)
end