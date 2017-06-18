<bb-page-history-category>
  <h2 id="page-title">
    <button type="button" class="btn pull-right" title="Search" aria-label="Search">
      <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
    </button>
    Category: { this.category.name }
    <div class="clearfix"></div>
  </h2>
  <hr class="small" />
  <bb-transaction-list transactions="{ getTransactionsForCategory() }"></bb-transaction-list>
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
      return tag.transactionHasCategoryId(transaction, opts.id);
    });
  }

  transactionHasCategoryId(transaction, categoryId) {
    for (var i = 0; i < transaction.categories.length; i++) {
      if (transaction.categories[i].id === categoryId) {
        return true;
      }
    }
    return false;
  }
  </script>
</bb-page-history-category>
