<bb-page-budget>
  <bb-category-list categories="{ opts.categories }"></bb-category-list>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('income', 'plus-sign', '#income/who'),
    new bb.Button('expense', 'minus-sign', '#expense/who'),
    new bb.Button('accounts', 'info-sign', '#accounts', true)
  ];
  </script>
</bb-page-budget>
