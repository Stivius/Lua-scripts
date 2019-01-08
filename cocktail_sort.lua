local arr = {5,4,3,2,1}
local left = 1
local right = #arr

local t = left

while left < right do
	local j = left
	while j < right do
		if arr[j] > arr[j+1] then arr[j], arr[j+1] = arr[j+1], arr[j] end
		j = j + 1
	end
	right = right - 1
	local j = right
	while j > left do
		if arr[j] < arr[j-1] then arr[j], arr[j-1] = arr[j-1], arr[j] end
		j = j - 1
	end
	left = left + 1
end