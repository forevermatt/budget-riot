<bb-page-expense-category>
  <bb-category-selector categories="{ opts.dm.getCategories() }"
                        ref="selector"
                        transaction="{ opts.transaction }"></bb-category-selector>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('next', 'chevron-right', '#expense/summary'),
    new bb.Button('home', 'home', '#budget', true)
  ];

  this.one('mount', function() {
    this.refs.selector.on('next', function() {
      route('expense/summary');
    })
  })
  </script>
</bb-page-expense-category>
