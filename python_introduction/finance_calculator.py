                     
income = int(input("Enter your monthly income: "))
expenses = int(input("Enter your total monthly expenses: "))    

monthly_savings = income - expenses
print("Your monthly savings are:", monthly_savings)

interest_rate = 0.05
projected_savings = monthly_savings * 12 + (monthly_savings * 12 * interest_rate)

print ("Your projected savings after one year are:", projected_savings)              