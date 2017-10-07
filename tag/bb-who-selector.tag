<bb-who-selector>
  <form class="pad-vertical text-center" onsubmit="{ formSubmitted }">
    <label for="{ opts.field }">{ opts.title }</label>
    <input type="text" class="" id="{ opts.field }" ref="payee"
           value="{ opts.transaction.who }">
    <hr class="small" />
    <ul class="list-inline">
      <li each="{ opts.items }"><a href="javascript:void(0)"
                                   class="btn btn-default"
                                   onclick="{ payeeClicked }">{ name }</a></li>
    </ul>
  </form>

  <script>
  this.one('mount', function() {
    this.refs.payee.focus();
  });

  formSubmitted(formEvent) {
    var payeeName = this.refs.payee.value;
    this.recordPayee(formEvent, payeeName);
  }

  payeeClicked(clickEvent) {
    var payeeName = clickEvent.target.text;
    this.recordPayee(clickEvent, payeeName);
  }

  recordPayee(theEvent, payeeName) {
    theEvent.preventUpdate = true;
    opts.transaction.who = payeeName;
    this.trigger('next');
  }
  </script>
</bb-who-selector>
