<bb-page-income-category>
  <bb-category-selector categories="{ opts.categories }" next="#income/summary"></bb-category-selector>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('next', 'chevron-right', '#income/summary'),
    new bb.Button('home', 'home', '#budget', true)
  ];
  </script>
</bb-page-income-category>
