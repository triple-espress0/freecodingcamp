class Category:
  ledger = list()
  balance = 0
  
  def __init__(self, category):
    self.category = category

  def __str__(self):
    return 'asd'
  
  def deposit(self, deposit_amount, deposit_description = ''):
    deposit_entry = {'amount': deposit_amount, 'description': deposit_description}

    balance += deposit_amount
    ledger.append(deposit_entry)
    



create_spend_chart(categories):