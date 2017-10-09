<bb-page-expense-who>
  <bb-who-selector field="payee"
                   items="{ opts.dm.listPayeesByName() }"
                   ref="selector"
                   title="Paid to:"
                   transaction="{ opts.transaction }"></bb-who-selector>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('home', 'home', '#budget', true)
  ];

  this.one('mount', function() {
    this.refs.selector.on('next', function() {
      opts.dm.ensurePayeeExists(opts.transaction.who);
      route('expense/amount');
    })
  })
  </script>
</bb-page-expense-who>
