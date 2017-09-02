var bb = bb || {};

bb.DataManager = function(dataStore) {
  this.accountService = new bb.DataService('accounts', dataStore);
  this.budgetService = new bb.DataService('budget', dataStore);
  this.categoryService = new bb.DataService('categories', dataStore);
  this.transactionService = new bb.DataService('transactions', dataStore);
};

bb.DataManager.prototype.getBudgetForMonth = function(yearMonthId) {
  yearMonthId = yearMonthId || bb.Date.getCurrentYearMonthString();
  return this.budgetService.getListById(yearMonthId);
};

bb.DataManager.prototype.getCategoryName = function(categoryId) {
  var category = this.categoryService.getById(categoryId);
  return (category ? category.name : undefined);
};
