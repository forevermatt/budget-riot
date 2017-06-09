<bb-page-history-search>
  <h2 id="page-title">
    <button type="button" class="btn btn-xs pull-right" aria-label="Close search">
      <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
    </button>
    Search
    <input type="text" name="search" ref="search" onkeyup="{ refreshSearchResults }" />
  </h2>
  <hr class="small" />
  <bb-transaction-list transactions="{ this.searchResults }"></bb-transaction-list>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('back', 'circle-arrow-left', '#budget', true)
  ];

  this.searchResults = opts.transactions;

  refreshSearchResults() {
    let query = this.refs.search.value;

    if (query === '' || query == undefined) {
      this.searchResults = opts.transactions;
    } else {
      this.searchResults = opts.transactions.filter(function(transaction) {
        if (transaction.account && transaction.account.indexOf(query) >= 0) {
          return true;
        }

        if (String(transaction.amount).indexOf(query) === 0) {
          return true;
        }

        if (transaction.category && transaction.category.indexOf(query) >= 0) {
          return true;
        }

        if (transaction.date && transaction.date.indexOf(query) === 0) {
          return true;
        }

        if (transaction.who && transaction.who.indexOf(query) >= 0) {
          return true;
        }

        return false;
      });
    }
  }
  </script>
</bb-page-history-search>
