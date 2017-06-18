<bb-page-history-all>
  <h2 id="page-title">
    <button type="button" class="btn pull-right" aria-label="Search">
      <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
    </button>
    All Accounts
    <a href="#" class="btn btn-default space-horizontal">filter</a>
  </h2>
  <hr class="small" />
  <bb-transaction-list accounts="{ opts.accounts }"
                       transactions="{ opts.transactions }"></bb-transaction-list>
  <bb-button-row buttons="{ this.buttons }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('home', 'home', '#budget', true)
  ];
  </script>
</bb-page-history-all>
