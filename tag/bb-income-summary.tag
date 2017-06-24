<bb-income-summary>
  <form class="pad-top" novalidate onsubmit="{ formSubmitted }">
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
  if ( ! opts.transaction.whenTimestamp) {
    opts.transaction.whenTimestamp = Date.now();
  }
  this.friendlyDate = bb.Date.format(opts.transaction.whenTimestamp);

  if ( ! opts.transaction.accountId) {
    opts.transaction.accountId = 1;
  }

  var hasAtLeastOneCategory = false;
  for (var categoryId in opts.transaction.categories) {
    if (opts.transaction.categories.hasOwnProperty(categoryId)) {
      hasAtLeastOneCategory = true;
    }
  }

  if ( ! hasAtLeastOneCategory) {
    opts.transaction.categories = {
      0: {
        'name': '(general income)',
        'amount': opts.transaction.amountTotal
      }
    };
  }

  formSubmitted(formEvent) {
    formEvent.preventUpdate = true;
    formEvent.preventDefault = true;
    this.trigger('done');
  }

  getAccountNameFor(accountId) {
    return opts.accounts[accountId].name;
  }

  getNameOfFirst(categories) {
		for (var categoryId in categories) {
		  if (categories.hasOwnProperty(categoryId)) {
		    return categories[categoryId].name;
		  }
		}
    return null;
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
