<bb-page-income-who>
  <bb-who-selector field="from"
                   items="{ opts.dm.listIncomeSourcesByName() }"
                   ref="selector"
                   title="from:"
                   transaction="{ opts.transaction }"></bb-who-selector>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('home', 'home', '#budget', true)
  ];

  this.one('mount', function() {
    this.refs.selector.on('next', function() {
      opts.dm.ensureIncomeSourceExists(opts.transaction.who);
      route('income/amount');
    })
  })
  </script>
</bb-page-income-who>
