var bb = bb || {};

bb.BudgetApp = function(pageDom) {
  this.budget = new bb.Budget();
  this.page = new bb.Page(pageDom);
  this.routes = {
    'budget': {
      'tagName': 'bb-budget',
      'opts': {
        'categories': this.budget.categories,
        'buttons': this.page.buttons
      }
    },
    'expense/account': {
      'tagName': 'bb-expense-account',
      'opts': {
        'accounts': this.budget.accounts,
        'nextUrl': 'expense-summary.html',
        'buttons': [
          { 'name': 'back', 'icon': 'circle-arrow-left', 'url': 'expense-summary.html', 'pullLeft': true }
        ]
      }
    }
  };

  
  console.log(this.budget.accounts); // TEMP


  route(this.route.bind(this));
};

bb.BudgetApp.prototype.route = function(...pathSegments) {
  var path = pathSegments.join('/');
  var routeData = this.routes[path];
  if (routeData != undefined) {
    this.page.showTag(routeData.tagName, routeData.opts);
  } else {
    route('budget');
  }
};
