<bb-page-history-account>
  <h2 id="page-title">
    <button type="button" class="btn pull-right" aria-label="Search">
      <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
    </button>
    Account History
    <a href="#" class="btn btn-default space-horizontal">{ opts.account.name }</a>
  </h2>
  <hr class="small" />
  <bb-transaction-list transactions="{ getTransactionsForAccount() }"></bb-transaction-list>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('back', 'circle-arrow-left', '#budget', true)
  ];
  getTransactionsForAccount() {
    return opts.transactions.filter(function(transaction) {
      return (opts.account.name === transaction.account);
    });
  }
  </script>
</bb-page-history-account>
