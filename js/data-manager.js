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
  let newCategory = this.categoryService.add(category);
  this.addCategoryToBudgetMonth(newCategory.id);
  return newCategory;
};

bb.DataManager.prototype.addCategoryToBudgetMonth = function(categoryId) {
  let yearMonthId = bb.Date.getCurrentYearMonthString();
  this.budgetService.setPropertyOfEntryTo(yearMonthId, categoryId, {
    'budgetedAmount': 0,
    'remaining': 0
  });
};

bb.DataManager.prototype.addTransactionToList = function(yearMonthId, transactionData) {
  this.transactionService.addToList(yearMonthId, transactionData);
  for (let categoryId of Object.keys(transactionData.categories)) {
    if (categoryId < 1) {
      // Skip the "(general income)" category.
      continue;
    }
    this.updateRemainingForBudgetCategory(categoryId, yearMonthId);
  }
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

bb.DataManager.prototype.getAmountUsedForCategoryInMonth = function(categoryId, yearMonthId) {
  let amountUsed = 0;
  let transactionsForMonth = this.getTransactionById(yearMonthId);
  for (let transaction of transactionsForMonth) {
    if (transaction.categories[categoryId]) {
      amountUsed += transaction.categories[categoryId].amount;
    }
  }
  return amountUsed;
};

bb.DataManager.prototype.getBudgetCategoryForMonth = function(categoryId, yearMonthId) {
  let budgetForMonth = this.getBudgetForMonth(yearMonthId);
  return budgetForMonth[categoryId] || {};
};

bb.DataManager.prototype.getBudgetForMonth = function(yearMonthId) {
  let budgetForMonth = this.budgetService.getById(yearMonthId);
  if (!budgetForMonth) {
    const currentYearMonth = bb.Date.getCurrentYearMonthString();
    budgetForMonth = this.budgetService.getById(currentYearMonth) || {};
  }
  return budgetForMonth;
};

bb.DataManager.prototype.getBudgetForMonthInOrder = function(yearMonthId) {
  const budgetForMonth = this.getBudgetForMonth(yearMonthId);
  let list = [];
  for (var categoryId in budgetForMonth) {
    if (budgetForMonth.hasOwnProperty(categoryId)) {
      let budgetCategory = budgetForMonth[categoryId];
      list.push({
        'budgetedAmount': budgetCategory.budgetedAmount || 0,
        'remaining': budgetCategory.remaining || 0,
        'categoryId': categoryId,
        'categoryName': this.getCategoryName(categoryId)
      });
    }
  }
  return list.sort((a, b) => (a.categoryName || '').localeCompare(b.categoryName || ''));
};

bb.DataManager.prototype.getCategories = function() {
  return this.categoryService.getAll();
};

bb.DataManager.prototype.getCategoriesInOrder = function() {
  let categories = this.getCategories();
  let list = Object.values(categories);
  return list.sort((a, b) => (a.name || '').localeCompare(b.name || ''));
};

bb.DataManager.prototype.getCategoryById = function(categoryId) {
  return this.categoryService.getById(categoryId);
};

bb.DataManager.prototype.getCategoryByName = function(name) {
  return this.categoryService.getByName(name);
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
  return this.transactionService.getListById(id);
};

bb.DataManager.prototype.getTransactions = function() {
  return this.transactionService.getAll();
};

bb.DataManager.prototype.getTransactionsMatching = function(query) {
  if (!query) {
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

bb.DataManager.prototype.setBudgetedAmountForCategory = function(categoryId, amount) {
  if (categoryId == undefined) {
    throw new Error('No category ID was provided.');
  }
  const yearMonthId = bb.Date.getCurrentYearMonthString();
  let budgetedAmount = Number(amount || 0);
  let amountUsed = this.getAmountUsedForCategoryInMonth(categoryId, yearMonthId);
  this.budgetService.setPropertyOfEntryTo(yearMonthId, categoryId, {
    'budgetedAmount': budgetedAmount,
    'remaining': budgetedAmount - amountUsed
  });
};

bb.DataManager.prototype.updateCategory = function(category) {
  return this.categoryService.update(category);
};

bb.DataManager.prototype.updateRemainingForBudgetCategory = function(categoryId, yearMonthId) {
  let amountUsed = this.getAmountUsedForCategoryInMonth(categoryId, yearMonthId);
  let budgetCategory = this.getBudgetCategoryForMonth(categoryId, yearMonthId);
  let budgetedAmount = budgetCategory.budgetedAmount;
  this.budgetService.setPropertyOfEntryTo(yearMonthId, categoryId, {
    'budgetedAmount': budgetedAmount,
    'remaining': budgetedAmount - amountUsed
  });
};
