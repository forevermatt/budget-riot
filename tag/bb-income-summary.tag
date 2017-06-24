<bb-income-summary>
  <form class="pad-top" novalidate>
    <p>
      <a href="#income/who" class="btn btn-default"><b>{ opts.transaction.who }</b></a>
      <a href="#income/amount" class="btn btn-default pull-right">
        <sup>$</sup> { getTotal(opts.transaction.categories) }
      </a><br />
    </p>
    <p>
      <b class="btn-height">Account: </b>
      <a href="#income/account" class="btn btn-default pull-right">
        { getAccountNameFor(opts.transaction.accountId) }
      </a>
    </p>
    <p>
      <b class="btn-height">Category: </b>
      <a href="#income/category" class="btn btn-default pull-right">
        { getNameOfFirst(opts.transaction.categories) }
      </a>
    </p>
    <p>
      <b class="btn-height">Date: </b>
      <a href="#income/when" class="btn btn-default pull-right">{ this.friendlyDate }</a>
    </p>
    <p>
      <label for="comment">Comment:</label>
      <input type="text" class="pull-right" name="comment"
             value="{ opts.transaction.comment }" />
    </p>
  </form>

  <script>
  if ( ! opts.transaction.accountId) {
    opts.transaction.accountId = 1;
  }

  if ( ! opts.transaction.categories) {
    opts.transaction.categories = {
      0: {
        'name': '(general income)',
        'amount': opts.transaction.amountTotal
      }
    };
  }

  if ( ! opts.transaction.whenTimestamp) {
    opts.transaction.whenTimestamp = Date.now();
  }
  this.friendlyDate = bb.Date.format(opts.transaction.whenTimestamp);

  getAccountNameFor(accountId) {
    return opts.accounts[accountId].name;
  }

  getNameOfFirst(list) {
    return ((list.length > 0) ? list[0].name : null);
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
</bb-income-summary>
