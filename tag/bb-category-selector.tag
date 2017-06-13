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
        <a href="#">set up your categories</a> now?
      </div>
    </virtual>

    <div each="{ opts.categories }" class="row margin-bottom">
      <div class="col-xs-7 category-name">
        <a href="javascript:void(0)"
           class="btn btn-default { 'btn-primary': name === parent.opts.transaction.category }"
           onclick="{ categoryClick }"
           tabindex="1"
           aria-label="It was all { name }">{ name }</a>
      </div>
      <div class="col-xs-5 category-amount">
        <div class="input-group">
          <span class="input-group-addon">$</span>
          <input type="tel" autofocus="autofocus" class="form-control"
                 id="amount" placeholder="0.00"
                 tabindex="2"
                 aria-label="Amount for { name } category">
        </div>
      </div>
    </div>

  </form>

  <script>
  categoryClick(clickEvent) {
    opts.transaction.category = clickEvent.target.text;
    this.trigger('next');
  }
  </script>
</bb-category-selector>
