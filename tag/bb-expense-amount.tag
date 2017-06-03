<bb-expense-amount>
  <bb-amount-selector></bb-amount-selector>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
    this.buttons = [
      new bb.Button('next', 'circle-arrow-right', '#expense/category'),
      new bb.Button('back', 'circle-arrow-left', '#expense/who', true)
    ];
  </script>
</bb-expense-amount>
