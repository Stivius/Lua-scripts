function fromto(min, max, step)
	step = step or 1
	local current = min - step
	return function ()
		if current + step <= max then
			current = current + step
			return current
		end
	end
end

for i in fromto(1, 5, 2) do
	print(i)
end