<bb-page-history-account>
  <h2 id="page-title">
    <a href="#history/search" class="pull-right" title="Search" aria-label="Search">
      <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
    </a>
    <b class="editable" onclick="{ renameAccount }" title="(Click to edit)">{ this.account.name }</b>
    <div class="clearfix"></div>
  </h2>
  <hr class="small" />
  <bb-transaction-list accounts="{ opts.accounts }"
                       transactions="{ this.transactions }"></bb-transaction-list>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.on('mount', function() {
    this.loadMonth();
    this.loadMonth();
  });

  this.buttons = [
    new bb.Button('back', 'chevron-left', '#accounts', true)
  ];
  this.account = opts.accountService.getById(opts.id);
  this.monthsShown = 0;
  this.now = new Date();
  this.transactions = [];

  getTransactionsForAccountFrom(transactions) {
    return transactions.filter(function(transaction) {
      return (opts.id === transaction.accountId);
    });
  };

  loadMonth() {
    this.loadTransactionsFromMonthsAgo(this.monthsShown);
    this.monthsShown++;
  };

  loadTransactionsFromMonthsAgo(numMonthsAgo) {
    var yearMonthId = bb.Date.getYearMonthStringForMonthsBefore(numMonthsAgo, this.now);
    var transactionsForMonth = opts.transactionService.getById(yearMonthId);
    if (transactionsForMonth == null) {
      transactionsForMonth = [];
    }
    this.transactions.concat(this.getTransactionsForAccountFrom(transactionsForMonth))
  };

  renameAccount() {
    var newName = prompt('Edit account name:', this.account.name);
    if (newName != null) {
      opts.accountService.rename(this.account.id, newName);
    }
  };
  </script>
</bb-page-history-account>
