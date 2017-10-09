<bb-date-selector>
  <form class="pad-vertical text-center" novalidate onsubmit="{ formSubmitted }">
    <div class="input-group input-group-lg">
      <input aria-label="Amount"
             class="form-control"
             ref="date"
             type="date" />
    </div>
  </form>

  <script>
  this.one('mount', function() {
    this.refs.date.value = bb.Date.format(opts.transaction.whenTimestamp);
    this.refs.date.focus();
  });

  if ( ! opts.transaction.whenTimestamp) {
    opts.transaction.whenTimestamp = Date.now();
  }

  formSubmitted(formEvent) {
    formEvent.preventUpdate = true;
    var millisecondsTimestamp = new Date(this.refs.date.value).getTime();
    if ( ! isNaN(millisecondsTimestamp)) {
      this.trigger('select', millisecondsTimestamp);
    } else {
      this.refs.date.value = bb.Date.format(opts.transaction.whenTimestamp);
    }
  }
  </script>
</bb-date-selector>
