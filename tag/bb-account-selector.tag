<bb-account-selector>
  <form class="pad-vertical" novalidate>
    <p><b>Account:</b></p>
    <ul class="list-unstyled">
      <li each="{ opts.accounts }"><a href="{ parent.opts.nextUrl }" class="btn btn-default">{ name }</a></li>
    </ul>
  </form>
</bb-account-selector>
