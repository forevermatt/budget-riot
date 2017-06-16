var bb = bb || {};

bb.Transaction = function(config) {

  config = config || {};

  /* NOTE: Amounts are always in integers, counting the smallest unit of the *
   *       currency (such as cents, if the currency is USD).  */
  this.accountId = config.accountId;
  this.amountTotal = config.amountTotal;
  this.categories = config.categories || [];
  this.comment = config.comment;
  this.whenTimestamp = config.whenTimestamp;
  this.who = config.who;
};

bb.Transaction.format = function(amount) {
  return (Number(amount) / 100).toFixed(2);
};

bb.Transaction.reset = function(transaction) {
  for (var field in transaction) {
    if (transaction.hasOwnProperty(field)) {
      transaction[field] = undefined;
    }
  }
  transaction.categories = [];
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
  for (var i = 0; i < this.categories.length; i++) {
    tempTotal += this.categories[i].amount;
  }
  return tempTotal;
};
