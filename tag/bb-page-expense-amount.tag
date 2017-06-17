<bb-page-expense-amount>
  <bb-amount-selector ref="selector"
                      transaction="{ opts.transaction }"></bb-amount-selector>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('next', 'chevron-right', '#expense/category'),
    new bb.Button('home', 'home', '#budget', true)
  ];

  this.one('mount', function() {
    this.refs.selector.on('next', function() {
      route('expense/category');
    })
  })
  </script>
</bb-page-expense-amount>
