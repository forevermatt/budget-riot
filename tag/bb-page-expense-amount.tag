<bb-page-expense-amount>
  <bb-amount-selector ref="selector"
                      transaction="{ opts.transaction }"></bb-amount-selector>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.one('mount', function() {
    this.refs.selector.on('next', function() {
      route('expense/category');
    })
  })
  this.buttons = [
    new bb.Button('next', 'circle-arrow-right', '#expense/category'),
    new bb.Button('back', 'circle-arrow-left', '#expense/who', true)
  ];
  </script>
</bb-page-expense-amount>
