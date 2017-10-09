<bb-category-selector>
  <form class="pad-vertical" novalidate>
    <div class="row">
      <div class="col-xs-5"><p>It was all...</p></div>
      <div class="col-xs-2"><p><i>or</i></p></div>
      <div class="col-xs-5 text-center"><p>Split it up:</p></div>
    </div>

    <virtual if="{ !opts.categories }">
      <div class="alert alert-danger" role="alert">
        <b>Oops!</b> We couldn't find any categories. Would you like to
        <a href="#category/new">add a category</a> now?
      </div>
    </virtual>

    <div each="{ category, categoryId in opts.categories }" class="row margin-bottom">
      <div class="col-xs-7 category-name">
        <a href="javascript:void(0)"
           class="btn btn-default { 'btn-primary': parent.opts.transaction.categories[categoryId] }"
           onclick="{ categoryClick }"
           tabindex="1"
           aria-label="It was all { category.name }">{ category.name }</a>
      </div>
      <div class="col-xs-5 category-amount">
        <div class="input-group">
          <span class="input-group-addon">$</span>
          <input type="tel" autofocus="autofocus" class="form-control"
                 placeholder="0.00" tabindex="2"
                 aria-label="Amount for { category.name } category">
        </div>
      </div>
    </div>
  </form>

  <script>
  categoryClick(clickEvent) {
    var category = clickEvent.item.category;
    var categoryId = clickEvent.item.categoryId;
    opts.transaction.categories = {};
    opts.transaction.categories[categoryId] = {
      'name': category.name,
      'amount': opts.transaction.amountTotal
    };
    this.trigger('next');
  }
  </script>
</bb-category-selector>
