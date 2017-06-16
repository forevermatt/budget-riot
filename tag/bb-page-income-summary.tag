<bb-page-income-summary>
  <bb-income-summary accounts="{ opts.accounts }"
                     ref="summary"
                     transaction="{ opts.transaction }"></bb-income-summary>
  <bb-button-row buttons="{ this.buttons }" ref="buttons"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('done', 'ok-sign'),
    new bb.Button('back', 'circle-arrow-left', '#income/amount', true)
  ];

  this.on('mount', function() {
    this.refs.buttons.on('done', function() {
      var transactionData = JSON.parse(JSON.stringify(opts.transaction));
      opts.transactions.push(transactionData);
      bb.Transaction.reset(opts.transaction);
      route('budget');
    });
  });
  </script>
</bb-page-income-summary>
