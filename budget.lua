Budget = {}

function Budget:new(value, limit)
	t = {balance = value, limit = limit}
	setmetatable(t, {__index = Budget})
	self.Budget = self
	return t
end

function Budget:withdraw(value)
	self.balance = self.balance - value
	return self
end

function Budget:salary(value)
	self.balance = self.balance + value
	return self
end

function Budget:getbalance()
	return self.balance
end

me = Budget:new(1000, 100)

function me:withdraw(value)
	if value > self.limit then error("Limit is exceeded") end
	self.balance = self.balance - value
	return self
end

mother = Budget:new(50000)
father = Budget:new(50000)

print(me:getbalance())
print(mother:getbalance())
print(father:getbalance())

me:withdraw(100)
mother:salary(3500)
father:withdraw(10000)

print(me:getbalance())
print(mother:getbalance())
print(father:getbalance())