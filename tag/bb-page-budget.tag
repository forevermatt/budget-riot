<bb-page-budget>
  <h2 id="page-title">Budget</h2>
  <bb-category-list categories="{ opts.categories }"></bb-category-list>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('income', 'plus', '#income/who'),
    new bb.Button('expense', 'minus', '#expense/who'),
    new bb.Button('accounts', 'list', '#accounts', true)
  ];
  </script>
</bb-page-budget>
