<bb-category-selector>
  <form class="pad-vertical" novalidate>
    <div class="row">
      <div class="col-xs-5"><p>It was all...</p></div>
      <div class="col-xs-2"><p><i>or</i></p></div>
      <div class="col-xs-5 text-center"><p>Split it up:</p></div>
    </div>
    <div class="row margin-bottom">
      <div class="col-xs-7 category-name">
        <a href="{ opts.nextUrl }" class="btn btn-default" 
           aria-label="Set category as Auto">Auto</a>
      </div>
      <div class="col-xs-5 category-amount">
        <div class="input-group">
          <span class="input-group-addon">$</span>
          <input type="tel" autofocus="autofocus" class="form-control"
                 id="amount" placeholder="0.00"
                 aria-label="Amount for Auto category">
        </div>
      </div>
    </div>

    <div class="row margin-bottom">
      <div class="col-xs-7 category-name">
        <a href="{ opts.nextUrl }" class="btn btn-default" 
           aria-label="Set category as Auto">Food</a>
      </div>
      <div class="col-xs-5 category-amount">
        <div class="input-group">
          <span class="input-group-addon">$</span>
          <input type="tel" autofocus="autofocus" class="form-control"
                 id="amount" placeholder="0.00"
                 aria-label="Amount for Food category">
        </div>
      </div>
    </div>

    <div class="row margin-bottom">
      <div class="col-xs-7 category-name">
        <a href="{ opts.nextUrl }" class="btn btn-default" 
           aria-label="Set category as Auto">Household</a>
      </div>
      <div class="col-xs-5 category-amount">
        <div class="input-group">
          <span class="input-group-addon">$</span>
          <input type="tel" autofocus="autofocus" class="form-control"
                 id="amount" placeholder="0.00"
                 aria-label="Amount for Household category">
        </div>
      </div>
    </div>

  </form>
</bb-category-selector>
