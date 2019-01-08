function insert(s, pos, word)
	return s:sub(1, pos - 1) .. word .. s:sub(pos)
end

function remove(s, pos, n)
	return s:sub(1, pos - 1) .. s:sub(pos + n)
end

function insertUtf8(s, pos, word)
	return s:sub(1, utf8.offset(s, pos) - 1) .. word .. s:sub(utf8.offset(s, pos))
end

function removeUtf8(s, pos, n)
	return s:sub(1, utf8.offset(s, pos) - 1) .. s:sub(utf8.offset(s, pos) + utf8.offset(s, pos + n) - utf8.offset(s, pos))
end

-- print(removeUtf8("açdão", 3, 2))