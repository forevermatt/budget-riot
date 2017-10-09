<bb-page-income-account>
  <bb-account-selector accounts="{ opts.dm.getAccounts() }"
                       ref="selector"
                       transaction="{ opts.transaction }"></bb-account-selector>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('home', 'home', '#budget', true)
  ];

  this.one('mount', function() {
    this.refs.selector.on('select', function(accountId) {
      if (accountId) {
        opts.transaction.accountId = String(accountId);
        route('income/summary');
      } else {
        console.log('No account ID was provided.');
      }
    });
  });
  </script>
</bb-page-income-account>
