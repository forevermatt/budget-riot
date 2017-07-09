<bb-page-category-new>
  <h2 id="page-title">New Category</h2>
  <form class="pad-vertical" novalidate onsubmit="{ formSubmitted }">
    <div class="input-group input-group-lg">
      <input aria-label="New category name"
             class="form-control"
             placeholder="New category name"
             ref="name"
             type="text" />
    </div>
  </form>
  <bb-button-row buttons="{ this.buttons }" ref="buttons"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('done', 'ok'),
    new bb.Button('back', 'chevron-left', '#budget', true)
  ];

  this.one('mount', function() {
    this.refs.name.focus();
    this.refs.buttons.on('done', function() {
      this.saveNewCategory();
    })
  });

  formSubmitted(formEvent) {
    formEvent.preventUpdate = true;
    this.saveNewCategory();
  }

  saveNewCategory() {
    var name = String(this.refs.name.value).trim();
    if (name) {
      if ( ! opts.categoryService.isNameInUse(name)) {
        opts.categoryService.add(name);
      }
      route('budget');
    } else {
      this.refs.name.value = '';
    }
  }
  </script>
</bb-page-category-new>
