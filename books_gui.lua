require("wx")

Accounts = {} 
NormalAccounts = {money = 1000, books = {["1"] = 0, ["2"] = 0, ["3"] = 0}}

function NormalAccounts:new(tab)
	t = tab or {}
	setmetatable(t, {__index = NormalAccounts})
	self.NormalAccounts = self
	return t
end

function NormalAccounts:getmoney()
	return self.money
end

function NormalAccounts:booktype(book)
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
        return ""
	end
end

DiscountAccounts = NormalAccounts:new({discount = 0})

function DiscountAccounts:new(tab)
	t = tab or {}
	setmetatable(t, {__index = DiscountAccounts})
	self.DiscountAccounts = self
	return t
end

VipAccounts = DiscountAccounts:new({discbooks = 0})

function VipAccounts:new(tab)
	t = tab or {}
	setmetatable(t, {__index = VipAccounts})
	self.VipAccounts = self
	return t
end

local UI = {}
local NB = {}
local NC = {}

Accounts["Test"] = NormalAccounts:new({atype = 1, money = 10000})

array = wx.wxArrayString()
array:Add("Normal account")
array:Add("Discount account")
array:Add("VIP account")

NC.frame = wx.wxFrame(wx.NULL, wx.wxID_ANY, "New client", wx.wxDefaultPosition, wx.wxSize(150,150), wx.wxDEFAULT_FRAME_STYLE)
NC.text = wx.wxTextCtrl(NC.frame, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize)
NC.combo = wx.wxComboBox(NC.frame, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, array)
NC.button = wx.wxButton(NC.frame, wx.wxID_ANY, "Add client", wx.wxDefaultPosition, wx.wxDefaultSize)
NC.sizer = wx.wxBoxSizer(wx.wxVERTICAL)
NC.sizer:Add(NC.combo, 0, wx.wxALIGN_CENTER + wx.wxALL, 5)
NC.sizer:Add(NC.text, 0, wx.wxALIGN_CENTER + wx.wxALL, 5)
NC.sizer:Add(NC.button, 0, wx.wxALIGN_CENTER + wx.wxALL, 5)

NC.button:Connect(wx.wxID_ANY, wx.wxEVT_LEFT_DOWN, function ()
    local text = NC.combo:GetStringSelection()
    local name = NC.text:GetValue()
    if name ~= "" and text ~= "" then
        if text == "Normal account" then
            Accounts[name] = NormalAccounts:new({atype = 1, money = 10000})
        elseif text == "Discount account" then
            Accounts[name] = DiscountAccounts:new({atype = 2, money = 10000, discount = 10})
        elseif text == "VIP account" then
            Accounts[name] = VipAccounts:new({atype = 3, money = 10000, discount = 10, discbooks = 2})
         end
        UI.combo0:Insert(name, UI.combo0:GetCount())
        NC.text:SetValue("")
        NC.frame:Hide()
        print(NC.frame)
    else
        wx.wxMessageBox("Wrong value!", "Error", wx.wxOK + wx.wxICON_ERROR, NC.frame)
    end
end)

NC.frame:SetSizer(NC.sizer)

NB.frame = wx.wxFrame(wx.NULL, wx.wxID_ANY, "New book", wx.wxDefaultPosition, wx.wxSize(150,150), wx.wxDEFAULT_FRAME_STYLE)
NB.text = wx.wxTextCtrl(NB.frame, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize)
NB.button = wx.wxButton(NB.frame, wx.wxID_ANY, "Add book", wx.wxDefaultPosition, wx.wxDefaultSize)
NB.sizer = wx.wxBoxSizer(wx.wxVERTICAL)
NB.sizer:Add(NB.text, 0, wx.wxALIGN_CENTER + wx.wxALL, 5)
NB.sizer:Add(NB.button, 0, wx.wxALIGN_CENTER + wx.wxALL, 5)

NB.button:Connect(wx.wxID_ANY, wx.wxEVT_LEFT_DOWN, function ()
    if NB.text:GetValue() == "" then
        wx.wxMessageBox("The field is empty!", "Error", wx.wxOK + wx.wxICON_ERROR, NB.frame)
    else
        book = NB.text:GetValue()
        local i = 0
        for k in pairs(Accounts.books) do
            if k == book then wx.wxMessageBox("The book already exists!", "Error", wx.wxOK + wx.wxICON_ERROR, NB.frame); i = i +1; break end
        end
        if i == 0 then
            Accounts.books[book] = 0
            UI.combo1:Insert(book, UI.combo1:GetCount())
            UI.combo2:Insert(book, UI.combo2:GetCount())
            NB.text:SetValue("")
            NB.frame:Show(false)
        end
    end
end)

NB.frame:SetSizer(NB.sizer)

UI.frame = wx.wxFrame(wx.NULL, wx.wxID_ANY, "Books Store", wx.wxDefaultPosition, wx.wxSize(425, 425), wx.wxDEFAULT_FRAME_STYLE)
UI.sizer = wx.wxBoxSizer(wx.wxVERTICAL)
UI.sizer2 = wx.wxBoxSizer(wx.wxHORIZONTAL)
UI.sizer3 = wx.wxBoxSizer(wx.wxHORIZONTAL)
UI.sizer4 = wx.wxBoxSizer(wx.wxHORIZONTAL)
UI.sizer5 = wx.wxBoxSizer(wx.wxHORIZONTAL)
UI.sizer6 = wx.wxBoxSizer(wx.wxVERTICAL)
UI.sizer7 = wx.wxBoxSizer(wx.wxVERTICAL)
UI.sizer8 = wx.wxBoxSizer(wx.wxHORIZONTAL)
UI.sizer9 = wx.wxBoxSizer(wx.wxHORIZONTAL)

array = wx.wxArrayString()
array:Add("1")
array:Add("2")
array:Add("3")

names = wx.wxArrayString()
names:Add("Test")

UI.combo0 = wx.wxComboBox(UI.frame, wx.wxID_ANY, "Test", wx.wxDefaultPosition, wx.wxDefaultSize, names)

UI.combo1 = wx.wxComboBox(UI.frame, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, array)
UI.combo2 = wx.wxComboBox(UI.frame, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, array)

UI.book1 = wx.wxStaticText(UI.frame, wx.wxID_ANY, "Book:" ,wx.wxDefaultPosition, wx.wxDefaultSize)
UI.book2 = wx.wxStaticText(UI.frame, wx.wxID_ANY, "Book:" ,wx.wxDefaultPosition, wx.wxDefaultSize)
UI.amount1 = wx.wxStaticText(UI.frame, wx.wxID_ANY, "Amount:" ,wx.wxDefaultPosition, wx.wxDefaultSize)
UI.amount2 = wx.wxStaticText(UI.frame, wx.wxID_ANY, "Amount:" ,wx.wxDefaultPosition, wx.wxDefaultSize)
UI.money = wx.wxStaticText(UI.frame, wx.wxID_ANY, "Money: " .. Accounts[UI.combo0:GetValue()]:getmoney(), wx.wxDefaultPosition, wx.wxDefaultSize)
UI.books = wx.wxStaticText(UI.frame, wx.wxID_ANY, "Books: ", wx.wxDefaultPosition, wx.wxDefaultSize)

UI.spin1 = wx.wxSpinCtrl(UI.frame, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxSP_ARROW_KEYS, 1, 100, 1)
UI.spin2 = wx.wxSpinCtrl(UI.frame, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxSP_ARROW_KEYS, 1, 100, 1)
UI.button1 = wx.wxButton(UI.frame, wx.wxID_ANY, "Buy book", wx.wxDefaultPosition, wx.wxDefaultSize)
UI.button2 = wx.wxButton(UI.frame, wx.wxID_ANY, "Return book", wx.wxDefaultPosition, wx.wxDefaultSize)
UI.button3 = wx.wxButton(UI.frame, wx.wxID_ANY, "Add special client", wx.wxDefaultPosition, wx.wxDefaultSize)
UI.button4 = wx.wxButton(UI.frame, wx.wxID_ANY, "Add book", wx.wxDefaultPosition, wx.wxDefaultSize)

UI.button1:Connect(wx.wxID_ANY, wx.wxEVT_LEFT_DOWN, function ()
	local amount = UI.spin1:GetValue()
	local string = UI.combo1:GetStringSelection()
    local table = Accounts[UI.combo0:GetValue()]:booktype(string)
    if table == "" then
        wx.wxMessageBox("There is no such book in the shop!", "Error", wx.wxOK + wx.wxICON_ERROR, UI.frame)
    else
        local t = Accounts[UI.combo0:GetValue()].atype
        if t == 1 then
            if Accounts[UI.combo0:GetValue()].money >= table.bookvalue*amount and string ~= "" then
                Accounts[UI.combo0:GetValue()].money = Accounts[UI.combo0:GetValue()].money - (table.bookvalue*amount)
                Accounts[UI.combo0:GetValue()].books[string] = Accounts[UI.combo0:GetValue()].books[string]+1 or 0
                UI.money:SetLabel("Money: " .. Accounts[UI.combo0:GetValue()]:getmoney())
                wx.wxMessageBox("You have bought new book!", "Infromation", wx.wxOK + wx.wxICON_INFORMATION, UI.frame)
            else
                wx.wxMessageBox("You have not enough money!", "Error", wx.wxOK + wx.wxICON_ERROR, UI.frame)
            end
        elseif t == 2 then
            if Accounts[UI.combo0:GetValue()].money >= table.bookvalue*amount and string ~= "" then
                Accounts[UI.combo0:GetValue()].money = Accounts[UI.combo0:GetValue()].money - (table.bookvalue*amount*(1 - Accounts[UI.combo0:GetValue()].discount/100))
                Accounts[UI.combo0:GetValue()].books[string] = Accounts[UI.combo0:GetValue()].books[string]+1 or 0
                UI.money:SetLabel("Money: " .. Accounts[UI.combo0:GetValue()]:getmoney())
                wx.wxMessageBox("You have bought new book!", "Infromation", wx.wxOK + wx.wxICON_INFORMATION, UI.frame)
            else
                wx.wxMessageBox("You have not enough money!", "Error", wx.wxOK + wx.wxICON_ERROR, UI.frame)
            end
        elseif t == 3 then
            if Accounts[UI.combo0:GetValue()].money >= table.bookvalue*amount and string ~= "" then
                local sum
                if amount % 2 == 0 then
                    sum = amount/Accounts[UI.combo0:GetValue()].discbooks
                else
                    sum = ((amount-1)/Accounts[UI.combo0:GetValue()].discbooks)+1
                end
                Accounts[UI.combo0:GetValue()].money = Accounts[UI.combo0:GetValue()].money - (table.bookvalue*amount*(1 - Accounts[UI.combo0:GetValue()].discount/100))
                Accounts[UI.combo0:GetValue()].books[string] = Accounts[UI.combo0:GetValue()].books[string]+1 or 0
                UI.money:SetLabel("Money: " .. Accounts[UI.combo0:GetValue()]:getmoney())
                wx.wxMessageBox("You have bought new book!", "Infromation", wx.wxOK + wx.wxICON_INFORMATION, UI.frame)
            else
                wx.wxMessageBox("You have not enough money!", "Error", wx.wxOK + wx.wxICON_ERROR, UI.frame)
            end
        end
    end
end)

UI.button2:Connect(wx.wxID_ANY, wx.wxEVT_LEFT_DOWN, function ()
	local amount = UI.spin2:GetValue()
	local string = UI.combo2:GetStringSelection()
    local table = Accounts[UI.combo0:GetValue()]:booktype(string)
    if table == "" then
        wx.wxMessageBox("There is no such book in the shop!", "Error", wx.wxOK + wx.wxICON_ERROR, UI.frame)
    else
        if Accounts.books[string] >= amount and string ~= "" then 
            Accounts[UI.combo0:GetValue()].money = Accounts[UI.combo0:GetValue()].money + (table.bookvalue*amount*0.5)
            Accounts[UI.combo0:GetValue()].books[string] = Accounts[UI.combo0:GetValue()].books[string]-1 or 0
            UI.money:SetLabel("Money: " .. Accounts[UI.combo0:GetValue()]:getmoney())
            wx.wxMessageBox("You have returned book in the shop!", "Infromation", wx.wxOK + wx.wxICON_INFORMATION, UI.frame)
        else
            wx.wxMessageBox("You have not such book!", "Error", wx.wxOK + wx.wxICON_ERROR, UI.frame)
        end
    end
end)

UI.button3:Connect(wx.wxID_ANY, wx.wxEVT_LEFT_DOWN, function ()
    NC.frame:Show(true)
end)

UI.button4:Connect(wx.wxID_ANY, wx.wxEVT_LEFT_DOWN, function ()
	NB.frame:Show(true)
end)

UI.menu1 = wx.wxMenu()
UI.menu2 = wx.wxMenu()

UI.menubar = wx.wxMenuBar()
UI.menubar:Append(UI.menu1, "Help")
UI.menubar:Append(UI.menu2, "About")

UI.sizer2:Add(UI.book1, 0, wx.wxALIGN_CENTER + wx.wxALL, 5)
UI.sizer2:Add(UI.combo1, 0, wx.wxALIGN_CENTER + wx.wxALL, 5)
UI.sizer3:Add(UI.book2, 0, wx.wxALIGN_CENTER + wx.wxALL, 5)
UI.sizer3:Add(UI.combo2, 0, wx.wxALIGN_CENTER + wx.wxALL, 5)

UI.sizer4:Add(UI.amount1, 0, wx.wxALIGN_CENTER + wx.wxALL, 5)
UI.sizer4:Add(UI.spin1, 0, wx.wxALIGN_CENTER + wx.wxALL, 5)
UI.sizer5:Add(UI.amount2, 0, wx.wxALIGN_CENTER + wx.wxALL, 5)
UI.sizer5:Add(UI.spin2, 0, wx.wxALIGN_CENTER + wx.wxALL, 5)

UI.sizer6:Add(UI.sizer2)
UI.sizer6:Add(UI.sizer4)
UI.sizer6:Add(UI.button1, 0, wx.wxALIGN_CENTER + wx.wxALL, 5)
UI.sizer7:Add(UI.sizer3)
UI.sizer7:Add(UI.sizer5)
UI.sizer7:Add(UI.button2, 0, wx.wxALIGN_CENTER + wx.wxALL, 5)

UI.sizer8:Add(UI.sizer6)
UI.sizer8:Add(UI.sizer7)

UI.sizer9:Add(UI.combo0, 0, wx.wxALL, 10)
UI.sizer9:Add(UI.button3, 0, wx.wxALL, 10)
UI.sizer9:Add(UI.button4, 0, wx.wxALL, 10)

UI.sizer:Add(UI.sizer9, 0, bit32.bor(wx.wxRIGHT, wx.wxALIGN_RIGHT))
UI.sizer:Add(UI.sizer8)
UI.sizer:Add(UI.money, 0, wx.wxALL, 5)
UI.sizer:Add(UI.books, 0, wx.wxALL, 5)

UI.frame:SetSizer(UI.sizer)
UI.frame:SetMenuBar(UI.menubar)

UI.frame:Show(true)

wx.wxGetApp():MainLoop()