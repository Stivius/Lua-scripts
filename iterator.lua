line = "First second third fourth fifth sixth seventh"

function allwords(line)
	pos = 1
    local function iter()
    	word = string.find(line,"%w+",pos)
    	if word ~= nil then -- if word exists
    		local b, e = string.find(line,"%w+",pos) -- the begin and the end of the word
    		pos = e + 1
    		return string.sub(line,b,e+1) -- return word
    	end
    end
    return iter -- iterator function
end

for word in allwords(line) do
    print("word: " .. word)
end