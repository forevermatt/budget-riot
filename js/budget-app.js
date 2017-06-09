var bb = bb || {};

bb.BudgetApp = function(pageDom) {
  this.accounts = [{
    'name': '23: checking'
  }, {
    'name': '71: credit card'
  }, {
    'name': '85: other credit card'
  }, {
    'name': 'cash'
  }];
  this.budget = new bb.Budget();
  this.currentAccount = this.accounts[0];
  this.currentCategory = this.budget.categories[1];
  this.expense = {};
  this.income = {};
  this.page = new bb.Page(pageDom);
  this.transactions = [{
      'date': '3/5',
      'who': "Dunkin' Donuts",
      'amount': 2.67,
      'category': 'Food',
      'account': '23: checking'
    }, {
      'date': '3/4',
      'who': 'Walmart',
      'amount': 5.70,
      'categories': [{
        'name': 'Food',
        'amount': 2.99
      }, {
        'name': 'Household',
        'amount': 2.71
      }],
      'account': '23: checking'
    }, {
      'date': '3/4',
      'who': "Lowe's",
      'amount': 15.54,
      'category': 'Household',
      'account': '71: credit card'
    }, {
      'date': '3/4',
      'who': 'Chick-fil-A',
      'amount': 2.30,
      'category': 'Food',
      'account': '23: checking'
    }]
  this.routes = {
    'budget': {
      'tagName': 'bb-page-budget',
      'opts': {
        'categories': this.budget.categories
      }
    },
    'expense/account': {
      'tagName': 'bb-page-expense-account',
      'opts': {
        'accounts': this.accounts
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
    },
    'history/account': {
      'tagName': 'bb-page-history-account',
      'opts': {
        'account': this.currentAccount,
        'transactions': this.transactions
      }
    },
    'history/all': {
      'tagName': 'bb-page-history-all',
      'opts': {
        'transactions': this.transactions
      }
    },
    'history/category': {
      'tagName': 'bb-page-history-category',
      'opts': {
        'category': this.currentCategory,
        'transactions': this.transactions
      }
    },
    'history/search': {
      'tagName': 'bb-page-history-search',
      'opts': {
        'transactions': this.transactions
      }
    },
    'income/account': {
      'tagName': 'bb-page-income-account',
      'opts': {
        'accounts': this.accounts,
        'next': '#income/summary'
      }
    },
    'income/amount': {
      'tagName': 'bb-page-income-amount',
      'opts': {
      }
    },
    'income/summary': {
      'tagName': 'bb-page-income-summary',
      'opts': {
        'income': this.income
      }
    },
    'income/who': {
      'tagName': 'bb-page-income-who',
      'opts': {
        'items': this.budget.incomeSources
      }
    }
  };
  route(this.route.bind(this));
};

bb.BudgetApp.prototype.route = function(...pathSegments) {
  var path = pathSegments.join('/');
  if (path === '') {
    route('budget');
    return;
  }

  var routeData = this.routes[path];
  if (routeData != undefined) {
    this.page.showTag(routeData.tagName, routeData.opts);
  } else {
    this.page.showTag('bb-page-not-found', { 'route': path });
  }
};
