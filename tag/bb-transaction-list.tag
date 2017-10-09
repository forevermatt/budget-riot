<bb-transaction-list>
  <div each="{ opts.transactions }" onclick="{ toggle }"
       class="row pad-vertical-small details-toggler { 'details-show': show }">
    <div class="col-xs-2 text-center">{ bb.Date.short(whenTimestamp) }</div>
    <div class="col-xs-7">{ who }</div>
    <div class="col-xs-3 text-right">
      <sup>$</sup>{ getTotal(categories) }
    </div>
    <div class="col-xs-offset-2 col-xs-10 details-hidden">
      <virtual each="{ category, categoryId in categories }">
        <code class="category">{ category.name }: <sup>$</sup>{ bb.Transaction.format(category.amount) }</code>
      </virtual>
      <code show="{ categories }" class="category">
        <b>TOTAL: <sup>$</sup>{ getTotal(categories) }</b>
      </code>
      <code if="{ accountId }" class="account">{ getAccountNameById(accountId) }</code>
    </div>
  </div>
  <p if="{ opts.transactions.length === 0 }">
    <i>No matching transactions found.</i>
  </p>

  <script>
  getAccountNameById(accountId) {
    if (opts.accounts[accountId]) {
      return opts.accounts[accountId].name;
    }
    return null;
  }

  getTotal(categories) {
    var total = 0;
    for (var categoryId in categories) {
      if (categories.hasOwnProperty(categoryId)) {
        total += categories[categoryId].amount;
      }
    }
    return bb.Transaction.format(total);
  }

  toggle(event) {
    event.item.show = !event.item.show;
  }
  </script>
</bb-transaction-list>
