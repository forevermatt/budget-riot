<bb-expense-account>
  <bb-account-selector accounts="{ opts.accounts }"></bb-account-selector>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('back', 'circle-arrow-left', '#expense/summary', true)
  ];
  </script>
</bb-expense-account>
