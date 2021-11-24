#!/bin/ruby

require 'json'
require 'stringio'

# Complete the solve function below.
def solve(meal_cost, tip_percent, tax_percent)
    total_cost = (
        meal_cost + (meal_cost*(tip_percent/100.0)) + (meal_cost*(tax_percent/100.0))
    )
    return total_cost.round
end

meal_cost = gets.to_f

tip_percent = gets.to_i

tax_percent = gets.to_i

p solve(meal_cost, tip_percent, tax_percent)