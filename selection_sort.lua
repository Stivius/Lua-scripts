function selection_sort(...)
	local a = {...}
	for i = 1, #a do
		local mini = i
		for j = i, #a do
			if a[j] < a[mini] then
				mini = j
			end
		end
		a[i], a[mini] = a[mini], a[i]
	end
	for i = 1, #a do
		print(a[i])
	end
end

selection_sort(10,9,8,7,6,5,4,3,2,1)