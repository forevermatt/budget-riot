<bb-page-income-summary>
  <bb-income-summary account="{ opts.income.account }"
                     amount="{ opts.income.amount }"
                     who="{ opts.income.who }"></bb-income-summary>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('done', 'ok-sign', '#budget'),
    new bb.Button('back', 'circle-arrow-left', '#income/amount', true)
  ];
  </script>
</bb-page-income-summary>
