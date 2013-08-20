
-- Arithmetic metamethods

local mt = {}
local Obj = {}

function Obj.new (v) 
	local self = { ['value'] = v }
	setmetatable (self, mt);
	return self
end

local o = Obj.new (3);
local p = Obj.new (5);
local x = { value = 'moo' }


-- __add

mt.__add = function (a, b)
	return a.value..'(__add)'..b.value
end

assertTrue (o + p == '3(__add)5', 'Add operator should use __add metamethod, if provided [1]')
assertTrue (o + x == '3(__add)moo', 'Add operator should use __add metamethod, if provided [2]')
assertTrue (x + p == 'moo(__add)5', 'Add operator should use __add metamethod, if provided [3]')




-- __concat

mt.__concat = function (a, b)
	return a.value..'(__concat)'..b.value
end
assertTrue (o..p == '3(__concat)5', 'Concatenation operator should use __concat metamethod, if provided [1]')
assertTrue (o..x == '3(__concat)moo', 'Concatenation operator should use __concat metamethod, if provided [2]')
assertTrue (x..p == 'moo(__concat)5', 'Concatenation operator should use __concat metamethod, if provided [3]')




-- __div

mt.__div = function (a, b)
	return a.value..'(__div)'..b.value
end

assertTrue (o / p == '3(__div)5', 'Divide operator should use __div metamethod, if provided [1]')
assertTrue (o / x == '3(__div)moo', 'Divide operator should use __div metamethod, if provided [2]')
assertTrue (x / p == 'moo(__div)5', 'Divide operator should use __div metamethod, if provided [3]')




-- __mod

mt.__mod = function (a, b)
	return a.value..'(__mod)'..b.value
end

assertTrue (o % p == '3(__mod)5', 'Modulo operator should use __mod metamethod, if provided [1]')
assertTrue (o % x == '3(__mod)moo', 'Modulo operator should use __mod metamethod, if provided [2]')
assertTrue (x % p == 'moo(__mod)5', 'Modulo operator should use __mod metamethod, if provided [3]')




-- __mul

mt.__mul = function (a, b)
	return a.value..'(__mul)'..b.value
end

assertTrue (o * p == '3(__mul)5', 'Muliplication operator should use __mul metamethod, if provided [1]')
assertTrue (o * x == '3(__mul)moo', 'Muliplication operator should use __mul metamethod, if provided [2]')
assertTrue (x * p == 'moo(__mul)5', 'Muliplication operator should use __mul metamethod, if provided [3]')




-- __pow

mt.__pow = function (a, b)
	return a.value..'(__pow)'..b.value
end

assertTrue (o ^ p == '3(__pow)5', 'Exponentiation operator should use __pow metamethod, if provided [1]')
assertTrue (o ^ x == '3(__pow)moo', 'Exponentiation operator should use __pow metamethod, if provided [2]')
assertTrue (x ^ p == 'moo(__pow)5', 'Exponentiation operator should use __pow metamethod, if provided [3]')




-- __sub

mt.__sub = function (a, b)
	return a.value..'(__sub)'..b.value
end

assertTrue (o - p == '3(__sub)5', 'Subtraction operator should use __sub metamethod, if provided [1]')
assertTrue (o - x == '3(__sub)moo', 'Subtraction operator should use __sub metamethod, if provided [2]')
assertTrue (x - p == 'moo(__sub)5', 'Subtraction operator should use __sub metamethod, if provided [3]')




-- __unm

mt.__unm = function (a)
	return '(__unm)'..a.value
end

assertTrue (-o == '(__unm)3', 'Negation operator should use __unm metamethod, if provided')








-- Relational metamethods


-- __eq
local x = 0

mt.__eq = function (a, b)
	x = x + 1
	return true
end

assertTrue (o == p, 'Equality operator should use __eq metamethod, if provided [1]')
assertTrue (x == 1, 'Equality operator should use __eq metamethod, if provided [2]')

assertTrue (not (o == 123), 'Equality operator should not use __eq metamethod if objects are of different type [1]')
assertTrue (x == 1, 'Equality operator should not use __eq metamethod if operands are of different type [2]')

assertTrue (o == o, 'Equality operator should not use __eq metamethod if the operands are the same object [1]')
assertTrue (x == 1, 'Equality operator should not use __eq metamethod if the operands are the same object [2]')




-- __le

x = 0

mt.__le = function (a, b)
	x = x + 1
	return a.value == 3
end

assertTrue (o <= p, 'Less than or equal to operator should use __le metamethod, if provided [1]')
assertTrue (x == 1, 'Less than or equal to operator should use __le metamethod, if provided [2]')
assertTrue (not (p <= o), 'Less than or equal to operator should use __le metamethod, if provided [3]')
assertTrue (x == 2, 'Less than or equal to operator should use __le metamethod, if provided [4]')




-- __lt

x = 0

mt.__lt = function (a, b)
	x = x + 1
	return a.value == 3
end

assertTrue (o < p, 'Less than operator should use __le metamethod, if provided [1]')
assertTrue (x == 1, 'Less than operator should use __le metamethod, if provided [2]')
assertTrue (not (p < o), 'Less than operator should use __le metamethod, if provided [3]')
assertTrue (x == 2, 'Less than operator should use __le metamethod, if provided [4]')



-- __call

x = ''
mt.__concat = nil

mt.__call = function (p1, p2)
	if p1 == o then 
		x = 'Ron ' 
	end
	
	x = x .. p2
	return 'CEO'
end

y = o('Dennis')

assertTrue (x == 'Ron Dennis', 'When executing a table, __call metamethod should be used, if provided')
assertTrue (y == 'CEO', 'When executing a table with a __call metamethod, the return value(s) of __call function should be returned')


