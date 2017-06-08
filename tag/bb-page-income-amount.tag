<bb-page-income-amount>
  <bb-amount-selector></bb-amount-selector>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('next', 'circle-arrow-right', '#income/summary'),
    new bb.Button('back', 'circle-arrow-left', '#income/who', true)
  ];
  </script>
</bb-page-income-amount>
