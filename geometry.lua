function area(a)
	if a.side ~= nil then
		return a.side^2
	elseif a.width ~= nil and a.height ~= nil then
		return a.width*a.height
	elseif a.radius ~= nil then
		return 3.14*a.radius^2
	else
		local p = (a.side1 + a.side2 + a.side3)/2
		return math.sqrt(p*(p-a.side1)*(p-a.side2)*(p-a.side3))
	end
end

function perimeter(a)
	if a.side ~= nil then
		return a.side*4
	elseif a.width ~= nil and a.height ~= nil then
		return (a.width+a.height)*2
	elseif a.radius ~= nil then
		return 2*3.14*a.radius
	else
		return a.side1 + a.side2 + a.side3
	end
end



square1 = {side	= 5}
square2	= {side	= 7}
rectangle1 = {width	= 4, height	= 6}
rectangle2	= {width = 8, height = 2}
circle1 =	{radius	= 3}
triangle1 =	{side1 = 5, side2 = 4, side3 = 3}

print(area(square1))
print(area(square2))
print(area(rectangle1))
print(area(rectangle2))
print(area(circle1))
print(area(triangle1))

print()

print(perimeter(square1))
print(perimeter(square2))
print(perimeter(rectangle1))
print(perimeter(rectangle2))
print(perimeter(circle1))
print(perimeter(triangle1))