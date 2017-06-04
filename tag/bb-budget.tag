<bb-budget>
  <bb-category-list categories="{ opts.categories }"></bb-category-list>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('income', 'plus-sign', 'income-who.html'),
    new bb.Button('expense', 'minus-sign', '#expense/who')
  ];
  </script>
</bb-budget>
