<bb-who-selector>
  <form class="pad-vertical text-center">
    <label for="{ opts.field }">{ opts.title }</label>
    <input type="text" class="" id="{ opts.field }">
    <hr class="small" />
    <ul class="list-inline">
      <li each="{ opts.items }"><a href="#" class="btn btn-default">{ name }</a></li>
    </ul>
  </form>
</bb-who-selector>
