execute unless score @p buln.trigger matches 10 unless score @p buln.data0 matches 99999999.. run function bubblellaneous:block/pincode_lock/user_input/add_digit
execute unless score @p buln.trigger matches 10 if score @p buln.data0 matches 99999999.. run function bubblellaneous:block/pincode_lock/user_input/finish
execute if score @p buln.trigger matches 10 run function bubblellaneous:block/pincode_lock/user_input/finish