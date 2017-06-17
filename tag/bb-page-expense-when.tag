<bb-page-expense-when>
  <bb-date-selector ref="selector"
                    transaction="{ opts.transaction }"></bb-date-selector>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('back', 'circle-arrow-left', '#expense/summary', true)
  ];

  this.one('mount', function() {
    this.refs.selector.on('select', function(dateString) {
      var millisecondsTimestamp = new Date(dateString).getTime();
      if ( ! isNaN(millisecondsTimestamp)) {
        opts.transaction.whenTimestamp = (new Date(dateString)).getTime();
        route('expense/summary');
      }
    })
  })
  </script>
</bb-page-expense-when>
