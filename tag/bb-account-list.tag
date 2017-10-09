<bb-account-list>
  <ul class="list-unstyled">
    <li each="{ account, accountId in opts.dm.getAccounts() }">
      <a href="#history/account/{ accountId }"
         class="btn btn-default">{ account.name }</a></li>
  </ul>
  <p if="{ opts.new }">
    <a href="#account/new">
      <span class="glyphicon glyphicon-asterisk"></span>
      Add a new account
    </a>
  </p>
</bb-account-list>
