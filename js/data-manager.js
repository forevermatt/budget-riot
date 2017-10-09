var bb = bb || {};

bb.DataManager = function(dataStore) {
  this.accountService = new bb.DataService('accounts', dataStore);
  this.budgetService = new bb.DataService('budget', dataStore);
  this.categoryService = new bb.DataService('categories', dataStore);
  this.incomeSourceService = new bb.DataService('incomeSources', dataStore);
  this.payeeService = new bb.DataService('payees', dataStore);
  this.transactionService = new bb.DataService('transactions', dataStore);
};

bb.DataManager.prototype.accountNameContains = function(accountId, lowerCaseQuery) {
  const accountName = this.getAccountNameById(accountId);
  return accountName && (accountName.toLowerCase().indexOf(lowerCaseQuery) >= 0);
};

bb.DataManager.prototype.addAccount = function(account) {
  return this.accountService.add(account);
};

bb.DataManager.prototype.addCategory = function(category) {
  return this.categoryService.add(category);
};

bb.DataManager.prototype.addTransactionToList = function(id, entry) {
  return this.transactionService.addToList(id, entry);
};

bb.DataManager.prototype.ensureIncomeSourceExists = function(name) {
  this.incomeSourceService.setPropertyOfEntryTo('byName', name, true);
};

bb.DataManager.prototype.ensurePayeeExists = function(name) {
  this.payeeService.setPropertyOfEntryTo('byName', name, true);
};

bb.DataManager.prototype.getAccountById = function(id) {
  return this.accountService.getById(id);
};

bb.DataManager.prototype.getAccountNameById = function(id) {
  var account = this.getAccountById(id);
  return (account ? account.name : undefined);
};

bb.DataManager.prototype.getAccounts = function() {
  return this.accountService.getAll();
};

bb.DataManager.prototype.getBudgetForMonth = function(yearMonthId) {
  yearMonthId = yearMonthId || bb.Date.getCurrentYearMonthString();
  return this.budgetService.getById(yearMonthId) || {};
};

bb.DataManager.prototype.getCategories = function() {
  return this.categoryService.getAll();
};

bb.DataManager.prototype.getCategoryById = function(categoryId) {
  return this.categoryService.getById(categoryId);
};

bb.DataManager.prototype.getCategoryName = function(categoryId) {
  var category = this.categoryService.getById(categoryId);
  return (category ? category.name : undefined);
};

bb.DataManager.prototype.getDefaultAccountId = function() {
  var accountIds = Object.keys(this.getAccounts());
  return (accountIds.length > 0) ? accountIds[0] : undefined;
};

bb.DataManager.prototype.getTransactionById = function(id) {
  return this.transactionService.getById(id);
};

bb.DataManager.prototype.getTransactions = function() {
  return this.transactionService.getAll();
};

bb.DataManager.prototype.getTransactionsMatching = function(query) {
  if (query === '' || query == undefined) {
    return [];
  }

  var matchingTransactions = [];
  var dm = this;

  for (const yearMonthId of Object.keys(this.getTransactions())) {
    var monthTransactions = this.getTransactionById(yearMonthId);

    var monthMatches = monthTransactions.filter(function(transaction) {
      return bb.Transaction.isTransactionMatchFor(
        transaction,
        query,
        dm.accountNameContains.bind(dm)
      );
    });

    matchingTransactions = matchingTransactions.concat(monthMatches);
  }

  return matchingTransactions;
};

bb.DataManager.prototype.isAccountNameInUse = function(name) {
  return this.accountService.isNameInUse(name);
};

bb.DataManager.prototype.isCategoryNameInUse = function(name) {
  return this.categoryService.isNameInUse(name);
};

bb.DataManager.prototype.listIncomeSourcesByName = function() {
  return this.incomeSourceService.getKeysFrom('byName');
};

bb.DataManager.prototype.listPayeesByName = function() {
  return this.payeeService.getKeysFrom('byName');
};

bb.DataManager.prototype.renameAccount = function(id, newName) {
  return this.accountService.rename(id, newName);
};

bb.DataManager.prototype.renameCategory = function(id, newName) {
  return this.categoryService.rename(id, newName);
};

bb.DataManager.prototype.updateCategory = function(category) {
  return this.categoryService.update(category);
};