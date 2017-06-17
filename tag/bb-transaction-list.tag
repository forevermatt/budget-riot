<bb-transaction-list>
  <div each="{ opts.transactions }" onclick="{ toggle }"
       class="row pad-vertical-small details-toggler { 'details-show': show }">
    <div class="col-xs-2 text-center">{ bb.Date.short(whenTimestamp) }</div>
    <div class="col-xs-7">{ who }</div>
    <div class="col-xs-3 text-right">
      <sup>$</sup>{ getTotal(categories) }
    </div>
    <div class="col-xs-offset-2 col-xs-10 details-hidden">
      <virtual each="{ categories }">
        <code class="category">{ name }: <sup>$</sup>{ bb.Transaction.format(amount) }</code>
      </virtual>
      <code show="{ categories }" class="category">
        <b>TOTAL: <sup>$</sup>{ getTotal(categories) }</b>
      </code>
      <code if="{ account }" class="account">{ account }</code>
    </div>
  </div>
  <p if="{ opts.transactions.length === 0 }">
    <i>No matching transactions found.</i>
  </p>

  <script>
  getTotal(categories) {
    var total = 0;
    if (categories) {
      for (var i = 0; i < categories.length; i++) {
        total += categories[i].amount;
      }
    }
    return bb.Transaction.format(total);
  }

  toggle(event) {
    event.item.show = !event.item.show;
  }
  </script>
</bb-transaction-list>
