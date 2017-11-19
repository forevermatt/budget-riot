<bb-page-category-amount>
  <bb-amount-selector ref="selector"
                      amount="{ getCategoryAmount() }"></bb-amount-selector>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('home', 'home', '#budget', true)
  ];

  this.categoryId = opts.id || route('budget');

  this.one('mount', function() {
    var categoryId = this.categoryId;
    this.refs.selector.on('next', function(resultingAmount) {
      opts.dm.setBudgetedAmountForCategory(categoryId, resultingAmount);
      route('budget');
    })
  })

  getCategoryAmount() {
    return opts.dm.getBudgetCategoryForMonth(this.categoryId);
  }
  </script>
</bb-page-category-amount>
