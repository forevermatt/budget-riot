<bb-page-history-category>
  <h2 id="page-title">
    <button type="button" class="btn pull-right" title="Search" aria-label="Search">
      <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
    </button>
    <b class="editable" onclick="{ renameCategory }"
       title="(Click to rename)">{ this.category.name }:</b>
    <span class="editable" onclick="{ changeBudgetedAmount }"
          title="(Click to edit amount)"><sup>$</sup> { bb.Transaction.format(this.category.budgetedAmount) }
    <div class="clearfix"></div>
  </h2>
  <hr class="small" />
  <bb-transaction-list accounts="{ opts.accountService.getAll() }"
                       transactions="{ getTransactionsForCategory() }"></bb-transaction-list>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('home', 'home', '#budget', true)
  ];
  this.category = opts.categoryService.getById(opts.id);

  changeBudgetedAmount() {
    var newAmount = prompt('Edit category amount:', this.category.budgetedAmount);
    if (newAmount != null) {
      var newAmountFloat = parseFloat(newAmount);
      if (isNaN(newAmountFloat)) {
        alert('That does not seem to be a number. Please try again.');
        return;
      }
      this.category.budgetedAmount = Number(newAmountFloat * 100);
      opts.categoryService.update(this.category);
    }
  }

  /** @todo Refactor this to use logic used in bb-page-history-account. */

  getTransactionsForCategory() {
    var yearMonthId = bb.Date.getCurrentYearMonthString();
    var transactions = opts.transactionService.getById(yearMonthId);
    if (transactions == null) {
      return [];
    }
    return transactions.filter(function(transaction) {
      return transaction.categories[opts.id];
    });
  }

  renameCategory() {
    var newName = prompt('Edit category name:', this.category.name);
    if (newName != null) {
      opts.categoryService.rename(this.category.id, newName);
    }
  }
  </script>
</bb-page-history-category>
