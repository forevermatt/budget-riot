<bb-account-list>
  <ul class="list-unstyled">
    <li each="{ account, accountId in opts.accounts }">
      <a href="#history/account/{ accountId }"
         class="btn btn-default">{ account.name }</a></li>
  </ul>
</bb-account-list>
