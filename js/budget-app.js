var bb = bb || {};

bb.BudgetApp = function(pageDom) {
  this.budget = new bb.Budget();
  this.expense = {};
  this.page = new bb.Page(pageDom);
  this.routes = {
    'budget': {
      'tagName': 'bb-budget',
      'opts': {
        'categories': this.budget.categories
      }
    },
    'expense/account': {
      'tagName': 'bb-expense-account',
      'opts': {
        'accounts': this.budget.accounts
      }
    },
    'expense/amount': {
      'tagName': 'bb-expense-amount',
      'opts': {}
    },
    'expense/category': {
      'tagName': 'bb-expense-category',
      'opts': {
        'categories': this.budget.categories
      }
    },
    'expense/summary': {
      'tagName': 'bb-page-expense-summary',
      'opts': {
        'account': this.expense.account,
        'categories': this.expense.categories,
        'payee': this.expense.payee
      }
    },
    'expense/who': {
      'tagName': 'bb-expense-who',
      'opts': {
        'payees': this.budget.payees
      }
    }
  };
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
