<bb-page-accounts>
  <h2 id="page-title">Accounts</h2>
  <bb-account-list dm="{ opts.dm }" new="{ true }"></bb-account-list>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('income', 'plus', '#income/who'),
    new bb.Button('expense', 'minus', '#expense/who'),
    new bb.Button('home', 'home', '#budget', true)
  ];
  </script>
</bb-page-accounts>
