<bb-expense-summary>
  <form class="pad-top" novalidate>
    <p>
      <a href="#expense/who" class="btn btn-default"><b>{ opts.who }</b></a>
      <a href="#expense/amount" class="btn btn-default pull-right"><sup>$</sup> { getTotal(opts.categories) }</a><br />
      <span class="expense-summary-categories">
        <virtual  each="{ opts.categories }">
          <code class="text-nowrap">{ name }: <sup>$</sup>{ amount }</code>
        </virtual>
      </span>
    </p>
    <p>
      <b class="btn-height">Acct: </b>
      <a href="#expense/account" class="btn btn-default pull-right">{ opts.account }</a>
    </p>
    <p>
      <b class="btn-height">Date: </b>
      <a href="#" class="btn btn-default pull-right">Today, 3/17</a>
    </p>
    <p>
      <label for="comment">Comment:</label>
      <input type="text" class="pull-right" name="comment" id="comment" />
    </p>
  </form>

  <script>
  getTotal(categories) {
    var total = 0;
    for (var i = 0; i < categories.length; i++) {
      total += categories[i].amount;
    }
    return total;
  }
  </script>
</bb-expense-summary>
