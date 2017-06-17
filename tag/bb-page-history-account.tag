<bb-page-history-account>
  <h2 id="page-title">
    <a href="#history/search" class="pull-right" title="Search" aria-label="Search">
      <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
    </a>
    <b>{ this.account.name }</b>
    <div class="clearfix"></div>
  </h2>
  <hr class="small" />
  <bb-transaction-list transactions="{ getTransactionsForAccount() }"></bb-transaction-list>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('back', 'circle-arrow-left', '#accounts', true)
  ];
  opts.id = opts.id || getAnAccountId();
  this.account = opts.accounts[opts.id];

  getAnAccountId() {
    for (var accountId in opts.accounts) {
      if (opts.accounts.hasOwnProperty(accountId)) {
        return accountId;
      }
    }
    return 1;
  }

  getTransactionsForAccount() {
    return opts.transactions.filter(function(transaction) {
      return (opts.id === transaction.accountId);
    });
  }
  </script>
</bb-page-history-account>
