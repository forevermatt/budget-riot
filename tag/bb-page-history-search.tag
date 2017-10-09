<bb-page-history-search>
  <h2 id="page-title">
    <button type="button" class="btn btn-xs pull-right" aria-label="Close search">
      <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
    </button>
    Search
    <input type="text" name="search" ref="search" onkeyup="{ refreshSearchResults }" />
  </h2>
  <hr class="small" />
  <bb-transaction-list accounts="{ opts.dm.getAccounts() }"
                       transactions="{ this.searchResults }"></bb-transaction-list>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('home', 'home', '#budget', true)
  ];

  this.searchResults = [];

  refreshSearchResults() {
    let query = this.refs.search.value;
    this.searchResults = opts.dm.getTransactionsMatching(query);

    console.log(this.searchResults);
  }
  </script>
</bb-page-history-search>
