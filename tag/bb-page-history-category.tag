<bb-page-history-category>
  <h2 id="page-title">
    <button type="button" class="btn pull-right" title="Search" aria-label="Search">
      <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
    </button>
    <b class="editable" onclick="{ renameCategory }"
       title="(Click to rename)">{ this.category.name }:</b>
    <a class="btn btn-default" href="#category/amount/{ this.category.id }">
      <sup>$</sup> { bb.Transaction.format(this.category.budgetedAmount) }
    </a>
    <div class="clearfix"></div>
  </h2>
  <hr class="small" />
  <bb-transaction-list accounts="{ opts.dm.getAccounts() }"
                       transactions="{ getTransactionsForCategory() }"></bb-transaction-list>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('home', 'home', '#budget', true)
  ];
  this.category = opts.dm.getCategoryById(opts.id);

  /** @todo Refactor this to use logic used in bb-page-history-account. */

  getTransactionsForCategory() {
    var yearMonthId = bb.Date.getCurrentYearMonthString();
    var transactions = opts.dm.getTransactionById(yearMonthId);
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
      opts.dm.renameCategory(this.category.id, newName);
    }
  }
  </script>
</bb-page-history-category>
