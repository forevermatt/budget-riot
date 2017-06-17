<bb-expense-summary>
  <form class="pad-top" novalidate>
    <p>
      <a href="#expense/who" class="btn btn-default"><b>{ opts.transaction.who }</b></a>
      <a href="#expense/amount" class="btn btn-default pull-right">
        <sup>$</sup> { getTotal(opts.transaction.categories) }
      </a><br />
      <span class="expense-summary-categories">
        <virtual each="{ opts.transaction.categories }">
          <code class="text-nowrap">{ name }: <sup>$</sup>{ bb.Transaction.format(amount) }</code>
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
    opts.transaction.accountId = 1;
  }

  getAccountNameFor(accountId) {
    return opts.accounts[accountId].name;
  }

  getTotal(categories) {
    var total = 0;
    for (var i = 0; i < categories.length; i++) {
      total += Number(categories[i].amount);
    }
    return bb.Transaction.format(total);
  }
  </script>
</bb-expense-summary>
