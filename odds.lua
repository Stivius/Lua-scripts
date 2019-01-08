function odds(a)
	for i = 1, #a do
		if a[i]%2 ~= 0 then print(a[i]) end
	end
end

print(odds({1,7,2,3,0,6}))