<bb-page-history-category>
  <h2 id="page-title">
    <button type="button" class="btn pull-right" aria-label="Search">
      <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
    </button>
    Category: { opts.category.name }
    <a href="#" class="btn btn-default space-horizontal">change</a>
  </h2>
  <hr class="small" />
  <bb-transaction-list transactions="{ getTransactionsForCategory() }"></bb-transaction-list>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('back', 'circle-arrow-left', '#budget', true)
  ];

  getTransactionsForCategory() {
    return opts.transactions.filter(function(transaction) {
      return (opts.category.name === transaction.category);
    });
  }
  </script>
</bb-page-history-category>
