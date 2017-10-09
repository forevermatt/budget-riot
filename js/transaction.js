var bb = bb || {};

bb.Transaction = function(config) {

  config = config || {};

  /* NOTE: Amounts are always in integers, counting the smallest unit of the *
   *       currency (such as cents, if the currency is USD).  */
  this.accountId = config.accountId;
  this.amountTotal = config.amountTotal;
  this.categories = config.categories || {};
  this.comment = config.comment;
  this.whenTimestamp = config.whenTimestamp;
  this.who = config.who;
};

bb.Transaction.format = function(amount) {
  if (amount == undefined) {
    amount = 0;
  }
  return (Number(amount) / 100).toFixed(2);
};

bb.Transaction.formatWhole = function(amount) {
  if (amount == undefined) {
    amount = 0;
  }
  return (Number(amount) / 100).toFixed(0);
};

bb.Transaction.isTransactionMatchFor = function(transaction, query, accountNameContains) {
  const lowerCaseQuery = query.toLowerCase();

  if (accountNameContains(transaction.accountId, lowerCaseQuery)) {
    return true;
  }

  if (bb.Transaction.format(transaction.amountTotal).indexOf(query) >= 0) {
    return true;
  }

  for (const category of Object.values(transaction.categories)) {
    if (category.name.toLowerCase().indexOf(lowerCaseQuery) >= 0) {
      return true;
    }
  }

  if (transaction.whenTimestamp) {
    if (bb.Date.short(transaction.whenTimestamp).indexOf(query) >= 0) {
      return true;
    }
  }

  if (transaction.who) {
    if (transaction.who.toLowerCase().indexOf(lowerCaseQuery) >= 0) {
      return true;
    }
  }

  return false;
};

bb.Transaction.reset = function(transaction) {
  for (var field in transaction) {
    if (transaction.hasOwnProperty(field)) {
      transaction[field] = undefined;
    }
  }
  transaction.categories = {};
};

bb.Transaction.prototype.isValid = function() {
  return this.accountId &&
         this.amountTotal &&
         this.categories.length &&
         this.whenTimestamp &&
         this.who &&
         (this.sumCategories() === this.amountTotal);
};

bb.Transaction.prototype.sumCategories = function() {
  var tempTotal = 0;
  for (var categoryId in this.categories) {
    if (this.categories.hasOwnProperty(categoryId)) {
      tempTotal += this.categories[categoryId].amount || 0;
    }
  }
  return tempTotal;
};
