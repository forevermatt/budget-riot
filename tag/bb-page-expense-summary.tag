<bb-page-expense-summary>
  <bb-expense-summary accounts="{ opts.accounts }"
                      ref="summary"
                      transaction="{ opts.transaction }"></bb-expense-summary>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('done', 'ok-sign', '#budget'),
    new bb.Button('back', 'circle-arrow-left', '#expense/category', true)
  ];
  </script>
</bb-page-expense-summary>
