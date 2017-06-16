<bb-page-expense-amount>
  <bb-amount-selector ref="selector"
                      transaction="{ opts.transaction }"></bb-amount-selector>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('next', 'circle-arrow-right', '#expense/category'),
    new bb.Button('back', 'circle-arrow-left', '#expense/who', true)
  ];

  this.one('mount', function() {
    this.refs.selector.on('next', function() {
      route('expense/category');
    })
  })
  </script>
</bb-page-expense-amount>
