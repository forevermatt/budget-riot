<bb-account-selector>
  <form class="pad-vertical" novalidate>
    <p><b>Account:</b></p>
    <ul class="list-unstyled">
      <li each="{ account, accountId in opts.accounts }">
        <a href="javascript:void(0)"
           class="btn btn-default { 'btn-primary': isSelected(accountId) }"
           onclick="{ click }">{ account.name }</a></li>
    </ul>
    <virtual if="{ hasNoAccounts(opts.accounts) }">
      <div class="alert alert-danger" role="alert">
        <b>Oops!</b> We couldn't find any accounts. Would you like to
        <a href="#account/new">add an account</a> now?
      </div>
    </virtual>
  </form>

  <script>
  click(clickTarget) {
    this.trigger('select', clickTarget.item.accountId);
  }

  hasNoAccounts(accounts) {
    return (Object.keys(accounts).length < 1);
  }

  isSelected(accountId) {
    return opts.transaction && opts.transaction.accountId === accountId;
  }
  </script>
</bb-account-selector>
