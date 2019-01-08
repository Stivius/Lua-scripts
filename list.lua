function list(a, n)
	for i = 1, #a do
		if a[i] < n then print(a[i]) end
	end
end

print(list({1,7,2,3,0,6}, 4))