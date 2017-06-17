<bb-page-income-amount>
  <bb-amount-selector ref="selector"
                      transaction="{ opts.transaction }"></bb-amount-selector>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('next', 'chevron-right', '#income/summary'),
    new bb.Button('home', 'home', '#budget', true)
  ];

  this.one('mount', function() {
    this.refs.selector.on('next', function() {
      route('income/summary');
    })
  })
  </script>
</bb-page-income-amount>
