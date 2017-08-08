<bb-page-history-category>
  <h2 id="page-title">
    <button type="button" class="btn pull-right" title="Search" aria-label="Search">
      <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
    </button>
    { this.category.name }: <sup>$</sup> { bb.Transaction.format(this.category.budgetedAmount) }
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
  </script>
</bb-page-history-category>
