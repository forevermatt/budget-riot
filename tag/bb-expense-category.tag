<bb-expense-category>
  <bb-category-selector categories="{ opts.categories }" next="#expense/summary"></bb-category-selector>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
    this.buttons = [
      new bb.Button('next', 'circle-arrow-right', '#expense/summary'),
      new bb.Button('back', 'circle-arrow-left', '#expense/amount', true)
    ];
  </script>
</bb-expense-category>
