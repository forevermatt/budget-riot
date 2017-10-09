<bb-app>
  <div class="container" id="page" ref="page"></div>

  <script>
  this.on('mount', function() {
    var budgetApp = new bb.BudgetApp(this.refs.page);
  });
  </script>
</bb-app>
