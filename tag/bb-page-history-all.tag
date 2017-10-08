<bb-page-history-all>
  <h2 id="page-title">
    <button type="button" class="btn pull-right" aria-label="Search">
      <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
    </button>
    All Accounts
    <a href="#" class="btn btn-default space-horizontal">filter</a>
  </h2>
  <hr class="small" />
  <bb-transaction-list accounts="{ opts.dm.getAccounts() }"
                       transactions="{ getTransactions() }"></bb-transaction-list>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('home', 'home', '#budget', true)
  ];
  this.monthsShown = 0;
  this.now = new Date();
  this.transactions = [];

  getTransactions() {
    this.loadMonths(6);
    return this.transactions;
  };

  loadMonth() {
    this.loadTransactionsFromMonthsAgo(this.monthsShown);
    this.monthsShown++;
  };

  loadMonths(numToLoad) {
    for (var i = 0; i < numToLoad; i++) {
      this.loadMonth();
    }
  };

  loadTransactionsFromMonthsAgo(numMonthsAgo) {
    var yearMonthId = bb.Date.getYearMonthStringForMonthsBefore(numMonthsAgo, this.now);
    var transactionsForMonth = opts.dm.getTransactionById(yearMonthId);
    if (transactionsForMonth == null) {
      transactionsForMonth = [];
    }
    for (var i = 0; i < transactionsForMonth.length; i++) {
      this.transactions.push(transactionsForMonth[i]);
    }
  };
  </script>
</bb-page-history-all>
