class Category:

    def __init__(self, category):
        self.category = category
        self.ledger = list()
        self.balance = 0

    def __str__(self):
        line_length = 30
        header_line = f"{int(((line_length - len(self.category)) / 2)) * '*'}{self.category}"
        header_line = header_line.ljust(30, '*')

        item_line = ''
        for item in self.ledger:
            description_line = f"{item['description']}".ljust(23)
            description_line = description_line[:23]
            amount = "%.2f" % item['amount']
            amount_line = f"{amount}".rjust(7)
            amount_line = amount_line[:7]
            item_line = f"{item_line}{description_line}{amount_line}\n"

        totals_line = f'Total: {"%.2f" % float(self.get_balance())}'  
        return f'{header_line}\n{item_line}{totals_line}'
    
    def check_funds(self, check_amount):
        if check_amount > self.balance: return False
        else: return True
    
    def deposit(self, deposit_amount, deposit_description = ''): 
        deposit_entry = {'amount': float(deposit_amount), 
                        'description': deposit_description}
      
        self.balance += deposit_amount
        self.ledger.append(deposit_entry)

    def withdraw(self, withdraw_amount, withdraw_description = ''):
        if not self.check_funds(withdraw_amount): return False
        else:
            withdraw_entry = {'amount': float(-withdraw_amount), 
                                'description': withdraw_description}
            self.balance -= withdraw_amount
            self.ledger.append(withdraw_entry)
            return True
       
    def get_balance(self):
        return self.balance

    def transfer(self, transfer_amount, category: 'Category'):
        if not self.check_funds(transfer_amount):
           return False
        else:
           self.withdraw(transfer_amount, f'Transfer to {category.category}')
           category.deposit(transfer_amount, f'Transfer from {self.category}')
           return True


def create_spend_chart(categories: 'Category'):
    total_spent = 0
    spent_per_category = {}
    percentages_per_category = {}
    for category in categories:
        for line in category.ledger:
            if line['amount'] < 0:
                line_amount = float(spent_per_category.get(category.category,0)) + line.get('amount')
                spent_per_category.update({category.category: line_amount})            
                total_spent += line['amount']
                
    chart_heading = 'Percentage spent by category\n'

    for key in spent_per_category:
        percent_of_total = round(((spent_per_category[key] / total_spent) * 100))
        percentages_per_category.update({key: percent_of_total})
    
    chart_upper = ''
        
    total_length = 5 + len(percentages_per_category) + ((len(percentages_per_category) - 1) * 2) + 2
  
    for i in range(100,-10,-10):
        chart_upper = f"{chart_upper}{(3 - len(str(i))) * ' '}{i}| "

        for percentage in percentages_per_category.values():
            if percentage >= i:
                chart_upper = f'{chart_upper}o  '
            else: chart_upper = f"{chart_upper}{'   '}"
        
        chart_upper = f"{chart_upper}{(total_length - len(chart_upper)) * ' '}"
        chart_upper = f'{chart_upper}\n'
        
    chart_middle = f"{4 * ' '}{(total_length - 4) * '-'}\n"
    chart_lower = f"{5 * ' '}"
    max_category_length = 0

    for key in percentages_per_category:
        if len(key) > max_category_length:
            max_category_length = len(key)
    is_last_char = False
    
    for i in range(max_category_length):
        
        for key in percentages_per_category:
            try:
                chart_lower = f"{chart_lower}{key[i]}{'  '}"
                is_last_char = False
                continue
            except:
                if is_last_char == False:
                    chart_lower = f"{chart_lower}{3 * ' '}"
                    continue
                else:
                    is_last_char = True
        chart_lower = f"{chart_lower}\n{5 * ' '}"
        i += 1

    result = f'{chart_heading}{chart_upper}{chart_middle}{chart_lower}' 
    result = result.rstrip()
    result = f'{result}  '
   
    return result