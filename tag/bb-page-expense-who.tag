<bb-page-expense-who>
  <bb-who-selector field="payee"
                   items="{ opts.payees }"
                   ref="selector"
                   title="Paid to:"
                   transaction="{ opts.transaction }"></bb-who-selector>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('back', 'circle-arrow-left', '#budget', true)
  ];
  this.one('mount', function() {
    this.refs.selector.on('next', function() {
      route('expense/amount');
    })
  })
  </script>
</bb-page-expense-who>
