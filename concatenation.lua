function test(...)
	local a = {...} local str = ""
	for i = 1, #a do
		str = str .. a[i]
	end
	return str
end

print(test("H","e","l","l","o",","," ","W","o","r","l","d","!"))