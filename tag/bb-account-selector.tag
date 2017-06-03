<bb-account-selector>
  <form class="pad-vertical" novalidate>
    <p><b>Account:</b></p>
    <ul class="list-unstyled">
      <li each="{ opts.accounts }"><a href="{ parent.opts.nextUrl }" class="btn btn-default">{ name }</a></li>
    </ul>
    <virtual if="{ !opts.accounts }">
      <div class="alert alert-danger" role="alert">
        <b>Oops!</b> We couldn't find any accounts. Would you like to
        <a href="#">set up your accounts</a> now?
      </div>
    </virtual>
  </form>
</bb-account-selector>
