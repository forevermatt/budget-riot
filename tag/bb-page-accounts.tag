<bb-page-accounts>
  <h2 id="page-title">Accounts</h2>
  <bb-account-list accounts="{ opts.accounts }"></bb-account-list>
  <virtual if="{ ! opts.accounts }">
    <div class="alert alert-danger" role="alert">
      <b>Oops!</b> We couldn't find any accounts. You may want to add one using
      the button below.
    </div>
  </virtual>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('new', 'asterisk', '#account/new'),
    new bb.Button('home', 'home', '#budget', true)
  ];
  </script>
</bb-page-accounts>
