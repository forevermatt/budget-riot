<bb-page-income-account>
  <bb-account-selector accounts="{ opts.accounts }"
                       ref="selector"
                       transaction="{ opts.transaction }"></bb-account-selector>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('home', 'home', '#budget', true)
  ];

  this.one('mount', function() {
    this.refs.selector.on('select', function(accountId) {
      opts.transaction.accountId = accountId;
      route('income/summary');
    });
  });
  </script>
</bb-page-income-account>
