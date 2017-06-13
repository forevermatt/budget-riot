<bb-page-expense-summary>
  <bb-expense-summary account="{ opts.transaction.account }"
                      categories="{ opts.transaction.categories || [{'name': opts.transaction.category, 'amount': opts.transaction.amount}] }"
                      ref="summary"
                      who="{ opts.transaction.who }"></bb-expense-summary>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('done', 'ok-sign', '#budget'),
    new bb.Button('back', 'circle-arrow-left', '#expense/category', true)
  ];
  </script>
</bb-page-expense-summary>
