<bb-page-income-category>
  <bb-category-selector categories="{ opts.categories }" next="#income/summary"></bb-category-selector>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('next', 'circle-arrow-right', '#income/summary'),
    new bb.Button('back', 'circle-arrow-left', '#income/amount', true)
  ];
  </script>
</bb-page-income-category>
