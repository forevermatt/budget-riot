<bb-page-account-new>
  <h2 id="page-title">New Account</h2>
  <form class="pad-vertical" novalidate onsubmit="{ formSubmitted }">
    <div class="input-group input-group-lg">
      <input aria-label="New account name"
             class="form-control"
             placeholder="New account name"
             ref="name"
             type="text" />
    </div>
  </form>
  <bb-button-row buttons="{ this.buttons }" ref="buttons"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('done', 'ok'),
    new bb.Button('back', 'chevron-left', '#accounts', true)
  ];

  this.one('mount', function() {
    this.refs.name.focus();
    this.refs.buttons.on('done', function() {
      this.saveNewAccount();
    })
  });

  formSubmitted(formEvent) {
    formEvent.preventUpdate = true;
    this.saveNewAccount();
  }

  saveNewAccount() {
    var name = String(this.refs.name.value).trim();
    if (name) {
      if ( ! opts.dm.isAccountNameInUse(name)) {
        opts.dm.addAccount({
          'name': name
        });
      }
      route('accounts');
    } else {
      this.refs.name.value = '';
    }
  }
  </script>
</bb-page-account-new>
