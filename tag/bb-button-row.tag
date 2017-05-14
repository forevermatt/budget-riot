<bb-button-row>
  <div id="button-row-spacer"></div>
  <div id="button-row">
    <a each="{ opts.buttons }" id="button-{ name }" class="btn { pull-right: pullRight, pull-left: pullLeft }"
       href="{ url }" role="button">
      <span if="{ icon }" class="glyphicon glyphicon-{ icon }" aria-hidden="true"></span><br />
      { name }
    </a>
    <div class="clearfix"></div>
  </div>
</bb-button-row>