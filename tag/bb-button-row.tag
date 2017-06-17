<bb-button-row>
  <div id="button-row-spacer"></div>
  <div id="button-row">
    <a each="{ opts.buttons }" id="button-{ name }" class="btn { pull-right: pullRight, pull-left: pullLeft }"
       href="{ url || 'javascript:void(0)' }" onclick="{ click }" role="button">
      <span class="button-circle">
        <span if="{ icon }" class="glyphicon glyphicon-{ icon }" aria-hidden="true"
              style="margin-left: { getLeftMarginForIcon(icon) }"></span><br />
      </span><br />
      { name }
    </a>
    <div class="clearfix"></div>
  </div>

  <style>
  :scope a:hover {
    color: #111;
  }

  :scope a:hover .button-circle {
    background-color: #111;
  }

  :scope .button-circle {
    border-radius: 3rem;
    background-color: #337ab7;
    color: #fff;
    display: inline-block;
    height: 6rem;
    padding: 1.5rem;
    overflow: hidden;
  	text-align: center;
    width: 6rem;
  }

  :scope .glyphicon {
    font-size: 3rem;
    line-height: 2.75rem;
  }
  </style>

  <script>
  click(clickEvent) {
    this.trigger(clickEvent.item.name);
  }

  getLeftMarginForIcon(icon) {
    switch (icon) {
      case 'home':
      return '-0.2rem';
      case 'minus':
        return '-0.25rem';
      case 'plus':
        return '0.1rem';
      default:
        return '0';
    }
  }
  </script>
</bb-button-row>
