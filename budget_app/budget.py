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
         amount_line = f"{item['amount']}".rjust(7)
         item_line = f"{item_line}{description_line}{amount_line}\n"

      totals_line = f'Total: {float(self.get_balance())}'  
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

def create_spend_chart(*categories: 'Category'):
    return 'TBD'
    # list = ','.join(categories)
    #print(categories[0][0])