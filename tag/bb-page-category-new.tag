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

  isCategoryNameInUse(name) {
    var lcNewName = String(name).toLowerCase();
    for (var i = 0; i < opts.categories.length; i++) {
      var lcExistingCategoryName = opts.categories[i].name.toLowerCase();
      if (lcExistingCategoryName === lcNewName) {
        return true;
      }
    }
    return false;
  }

  saveNewCategory() {
    var name = String(this.refs.name.value).trim();
    if (name) {
      if ( ! this.isCategoryNameInUse(name)) {
        opts.categories.push(new bb.Category(name, 0, 0));
      }
      route('budget');
    } else {
      this.refs.name.value = '';
    }
  }
  </script>
</bb-page-category-new>
