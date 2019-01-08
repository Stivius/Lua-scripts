local function next(max, value)
	if value ~= max then
		value = value + 1
		return value
	end
end

function fromto(min, max)
	return next, max, min - 1
end

for i in fromto(1,5) do
	print(i)
end