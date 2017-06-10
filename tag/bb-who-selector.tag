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
  formSubmitted(formEvent) {
    var payeeName = this.refs.payee.value;
    this.recordPayee(formEvent, payeeName);
  }

  getMatchingPayee(payeeName) {
    var matchingPayees = opts.items.filter(function(payee) {
      return (payee.name === payeeName);
    });
    if (matchingPayees.length > 0) {
      return matchingPayees[0];
    }
    return null;
  }

  payeeClicked(clickEvent) {
    var payeeName = clickEvent.target.text;
    this.recordPayee(clickEvent, payeeName);
  }

  recordPayee(theEvent, payeeName) {
    theEvent.preventUpdate = true;
    var matchingPayee = this.getMatchingPayee(payeeName);
    if (matchingPayee) {
      opts.transaction.who = matchingPayee.name;
    } else {
      opts.items.push({
        'name': payeeName
      });
      opts.transaction.who = payeeName;
    }
    this.trigger('next');
  }
  </script>
</bb-who-selector>
