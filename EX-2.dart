class BankAccount {
    // TODO
    String accountId;
    String accountOwner;
    double _balance = 0.0;
    BankAccount({required this.accountId, required this.accountOwner, double initialBalance = 0.0}) {
        this._balance = initialBalance;
    }
    double get balance => _balance;
    double withdraw(double amount) {
        if (amount > _balance) {
            throw Exception('Insufficient balance for withdrawal!');
        }
        _balance -= amount;
        return _balance;
    }
    double credit(double amount) {
        _balance += amount;
        return _balance;
    }
}

class Bank {
    // TODO
    String? _bankId;
    String name;
    List<BankAccount> _accounts = [];
    Bank({required this.name, required String? bankId}) {
        this._bankId = bankId;
    }
    BankAccount createAccount(String accountId, String accountOwner) {
        if (_accounts.any((account) => account.accountId == accountId)) {
            throw Exception('Account with ID $accountId already exists!');
        }
        BankAccount newAccount = BankAccount(accountId: accountId, accountOwner: accountOwner);
        _accounts.add(newAccount);
        return newAccount;
    }

}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank", bankId: "CADT001");

  BankAccount ronanAccount = myBank.createAccount("100", 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount("100", 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
