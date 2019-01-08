function desc(a, b, c)
	local D = (b^2 - 4*a*c)
	local x1 = (-b + math.sqrt(D))/(a*2)
	local x2 = (-b - math.sqrt(D))/(a*2)
	if D > 0 then
		return x1, x2
	elseif D == 0 then
		return x1
	else
		print("Нет корней")
	end
end


print(desc(-1, 5, 24))