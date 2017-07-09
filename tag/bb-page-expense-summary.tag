<bb-page-expense-summary>
  <bb-expense-summary accounts="{ opts.accountService.getAll() }"
                      ref="summary"
                      transaction="{ opts.transaction }"></bb-expense-summary>
  <bb-button-row buttons="{ this.buttons }" ref="buttons"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('done', 'ok'),
  ];

  this.on('mount', function() {
    this.refs.buttons.on('done', this.recordTransaction.bind(this));
    this.refs.summary.on('done', this.recordTransaction.bind(this));
  });

  recordTransaction() {
    var transactionData = JSON.parse(JSON.stringify(opts.transaction));
    opts.transactions.push(transactionData);
    bb.Transaction.reset(opts.transaction);
    route('budget');
  }
  </script>
</bb-page-expense-summary>
