-- vip clients with 2 books for 1 price

Accounts = {money = 1000, books = {["1"] = 0, ["2"] = 0, ["3"] = 0}}


--[[function readonly(t)
	local proxy = {}
	setmetatable(proxy, {__index = t, __newindex = function (t,k,v)
		error("Forbidden")
	end})
	return proxy
end ]]


function Accounts:new(tab)
	t = tab or {}
	setmetatable(t, {__index = Accounts})
	self.Accounts = self
	return t
end


function Accounts:getmoney()
	return self.money
end

function Accounts:addbook(book)
	for k in pairs(Accounts.books) do
		if k == book then error("The book already exists!") end
	end
	Accounts.books[book] = 0
end

function Accounts:buybook(cbooks, amount)
	amount = amount or 1
	if self.money >= cbooks.bookvalue*amount then
		self.money = self.money - (cbooks.bookvalue*amount)
		self.books[cbooks.tbook] = self.books[cbooks.tbook]+1 or 0
	else
		error("You have not enough money!")
	end
	return self
end

function Accounts:returnbook(cbooks, amount)
	amount = amount or 1
	if self.books[cbooks.tbook] >= amount then 
		self.money = self.money + (cbooks.bookvalue*amount*0.5)
		self.books[cbooks.tbook] = self.books[cbooks.tbook]-1 or 0
	else
		error("You have not such book!")
	end
	return self
end

function Accounts:booktype(book)
	local i
	for k in pairs(self.books) do
		if k == book then i = book end
	end
	if i == "1" then 
		return {bookvalue = 10, tbook = i}
	elseif i == "2" then 
		return {bookvalue = 20, tbook = i}
	elseif i == "3" then 
		return {bookvalue = 30, tbook = i}
	else
		error("There is no such book in the shop!")
	end
end

DiscountAccounts = Accounts:new({discount = 0})

function DiscountAccounts:new(tab)
	t = tab or {}
	setmetatable(t, {__index = DiscountAccounts})
	self.DiscountAccounts = self
	return t
end

function DiscountAccounts:buybook(cbooks, amount)
	amount = amount or 1
	if self.money >= cbooks.bookvalue*amount then
		self.money = self.money - (cbooks.bookvalue*amount*(1 - self.discount/100))
		self.books[cbooks.tbook] = self.books[cbooks.tbook]+1 or 0
	else
		error("You have not enough money!")
	end
	return self
end

VipAccounts = DiscountAccounts:new({discbooks = 0})

function VipAccounts:new(tab)
	t = tab or {}
	setmetatable(t, {__index = VipAccounts})
	self.VipAccounts = self
	return t
end

function VipAccounts:buybook(cbooks, amount)
	amount = amount or 1
	if self.money >= cbooks.bookvalue*amount then
		local sum
		if amount % 2 == 0 then
			sum = amount/self.discbooks
		else
			sum = ((amount-1)/self.discbooks)+1
		end
		self.money = self.money - (cbooks.bookvalue*sum*(1 - self.discount/100))
		self.books[cbooks.tbook] = self.books[cbooks.tbook]+1 or 0
	else
		error("You have not enough money!")
	end
	return self
end

account1 = Accounts:new({money = 10000})

print(account1:getmoney())
account1:buybook(account1:booktype("1"),5)
print(account1:getmoney())
account1:buybook(account1:booktype("2"),15)
print(account1:getmoney())
account1:returnbook(account1:booktype("1"),1)
print(account1:getmoney())



account2 = DiscountAccounts:new({money = 5000, discount = 10})

print(account2:getmoney())
account2:buybook(account2:booktype("1"),5)
print(account2:getmoney())
account2:buybook(account2:booktype("2"),15)
print(account2:getmoney())
account2:returnbook(account2:booktype("1"),1)
print(account2:getmoney())

account3 = VipAccounts:new({money = 5000, discount = 10, discbooks = 2})

print(account3:getmoney())
account3:buybook(account3:booktype("1"),5)
print(account3:getmoney())
account3:buybook(account3:booktype("2"),15)
print(account3:getmoney())
account3:returnbook(account3:booktype("1"),1)
print(account3:getmoney())