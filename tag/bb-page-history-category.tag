<bb-page-history-category>
  <h2 id="page-title">
    <button type="button" class="btn pull-right" title="Search" aria-label="Search">
      <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
    </button>
    Category: { this.category.name }
    <div class="clearfix"></div>
  </h2>
  <hr class="small" />
  <bb-transaction-list accounts="{ opts.accounts }"
                       transactions="{ getTransactionsForCategory() }"></bb-transaction-list>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('home', 'home', '#budget', true)
  ];
  opts.id = opts.id || getACategoryId();
  this.category = opts.categories[opts.id];

  getACategoryId() {
    for (var categoryId in opts.categories) {
      if (opts.categories.hasOwnProperty(categoryId)) {
        return categoryId;
      }
    }
    return 1;
  }

  getTransactionsForCategory() {
    var tag = this;
    return opts.transactions.filter(function(transaction) {
      return transaction.categories[opts.id];
    });
  }
  </script>
</bb-page-history-category>
