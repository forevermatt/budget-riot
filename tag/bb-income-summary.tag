<bb-income-summary>
  <form class="pad-top" novalidate>
    <p>
      <a href="#income/who" class="btn btn-default"><b>{ opts.who || '???' }</b></a>
      <a href="#income/amount" class="btn btn-default pull-right">
        <sup>$</sup> { opts.amount || '___' }
      </a><br />
    </p>
    <p>
      <b class="btn-height">Acct: </b>
      <a href="#income/account" class="btn btn-default pull-right">{ opts.account || '?' }</a>
    </p>
    <p>
      <b class="btn-height">Category: </b>
      <a href="#income/category" class="btn btn-default pull-right">(general income)</a>
    </p>
    <p>
      <b class="btn-height">Date: </b>
      <a href="#" class="btn btn-default pull-right">Today, 3/17</a>
    </p>
  </form>
</bb-income-summary>
