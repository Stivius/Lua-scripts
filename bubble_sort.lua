function bubble_sort(...)
	local a = {...}
	for i = 1, #a do
		for j = 1, #a-1 do
			if a[j] > a[j+1] then
				a[j+1], a[j] = a[j], a[j+1]
			end
		end
	end
	for i = 1, #a do
		print(a[i])
	end
end

bubble_sort(10,9,8,7,6,5,4,3,2,1)