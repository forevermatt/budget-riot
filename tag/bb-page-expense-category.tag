<bb-page-expense-category>
  <bb-category-selector categories="{ opts.categories }"
                        ref="selector"
                        transaction="{ opts.transaction }"></bb-category-selector>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.one('mount', function() {
    this.refs.selector.on('next', function() {
      route('expense/summary');
    })
  })
  this.buttons = [
    new bb.Button('next', 'circle-arrow-right', '#expense/summary'),
    new bb.Button('back', 'circle-arrow-left', '#expense/amount', true)
  ];
  </script>
</bb-page-expense-category>
