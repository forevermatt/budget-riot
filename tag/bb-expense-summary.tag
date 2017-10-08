<bb-expense-summary>
  <form class="pad-top" novalidate onsubmit="{ formSubmitted }">
    <p>
      <a href="#expense/who" class="btn btn-default"><b>{ opts.transaction.who }</b></a>
      <a href="#expense/amount" class="btn btn-default pull-right">
        <sup>$</sup> { getTotal(opts.transaction.categories) }
      </a><br />
      <span class="expense-summary-categories">
        <virtual each="{ category, categoryId in opts.transaction.categories }">
          <code class="text-nowrap">{ category.name }: <sup>$</sup>{ bb.Transaction.format(category.amount) }</code>
        </virtual>
      </span>
    </p>
    <p>
      <b class="btn-height">Account: </b>
      <a href="#expense/account" class="btn btn-default pull-right">
        { getAccountNameFor(opts.transaction.accountId) }
      </a>
    </p>
    <p>
      <b class="btn-height">Date: </b>
      <a href="#expense/when" class="btn btn-default pull-right">{ this.friendlyDate }</a>
    </p>
    <p>
      <label for="comment">Comment:</label>
      <input type="text" class="pull-right" name="comment"
             value="{ opts.transaction.comment }" />
    </p>
  </form>

  <script>
  if ( ! opts.transaction.whenTimestamp) {
    opts.transaction.whenTimestamp = Date.now();
  }
  this.friendlyDate = bb.Date.format(opts.transaction.whenTimestamp);

  if ( ! opts.transaction.accountId) {
    opts.transaction.accountId = opts.dm.getDefaultAccountId();
    if ( ! opts.transaction.accountId) {
      route('expense/account', null, true);
    }
  }

  formSubmitted(formEvent) {
    formEvent.preventUpdate = true;
    formEvent.preventDefault = true;
    this.trigger('done');
  }

  getAccountNameFor(accountId) {
    return opts.accounts[accountId].name;
  }

  getTotal(categories) {
    var total = 0;
    for (var categoryId in categories) {
      if (categories.hasOwnProperty(categoryId)) {
        total += Number(categories[categoryId].amount);
      }
    }
    return bb.Transaction.format(total);
  }
  </script>
</bb-expense-summary>
