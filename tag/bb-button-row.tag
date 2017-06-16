<bb-button-row>
  <div id="button-row-spacer"></div>
  <div id="button-row">
    <a each="{ opts.buttons }" id="button-{ name }" class="btn { pull-right: pullRight, pull-left: pullLeft }"
       href="{ url || 'javascript:void(0)' }" onclick="{ click }" role="button">
      <span if="{ icon }" class="glyphicon glyphicon-{ icon }" aria-hidden="true"></span><br />
      { name }
    </a>
    <div class="clearfix"></div>
  </div>

  <script>
  click(clickEvent) {
    this.trigger(clickEvent.item.name);
  }
  </script>
</bb-button-row>
