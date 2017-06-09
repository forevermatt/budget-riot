<bb-page-expense-who>
  <bb-who-selector field="payee" title="Paid to:" items="{ opts.payees }"></bb-who-selector>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('back', 'circle-arrow-left', '#budget', true)
  ];
  </script>
</bb-page-expense-who>
