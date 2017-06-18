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

  generateNewCategoryId() {
    var categoryId;
    do {
      categoryId = (new Date()).getMilliseconds();
    } while (opts.categories[categoryId]);
    return categoryId;
  }

  isCategoryNameInUse(name) {
    var lcNewName = String(name).toLowerCase();
    for (var categoryId in opts.categories) {
      if (opts.categories.hasOwnProperty(categoryId)) {
        var lcExistingCategoryName = opts.categories[categoryId].name.toLowerCase();
        if (lcExistingCategoryName === lcNewName) {
          return true;
        }
      }
    }
    return false;
  }

  saveNewCategory() {
    var name = String(this.refs.name.value).trim();
    if (name) {
      if ( ! this.isCategoryNameInUse(name)) {
        var newCategoryId = this.generatenewCategoryId();
        opts.categories[newCategoryId] = new bb.Category(
          newCategoryId,
          name
        );
      }
      route('budget');
    } else {
      this.refs.name.value = '';
    }
  }
  </script>
</bb-page-category-new>
