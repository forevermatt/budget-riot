<bb-date-selector>
  <form class="pad-vertical text-center" novalidate onsubmit="{ formSubmitted }">
    <div class="input-group input-group-lg">
      <input aria-label="Amount"
             class="form-control"
             ref="date"
             onchange="{ onChange }"
             oninput="{ onInput }"
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
    this.trigger('select', this.refs.date.value);
  }

  onChange(changeEvent) {
    console.log(changeEvent.target.value);
  }

  onInput(inputEvent) {
    console.log(inputEvent.target.value);
  }
  </script>
</bb-date-selector>
