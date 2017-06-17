var bb = bb || {};

bb.BudgetApp = function(pageDom) {
  this.accounts = {
    1: {
      'id': 1,
      'name': '23: checking'
    },
    2: {
      'id': 2,
      'name': 'cash'
    },
    3: {
      'id': 3,
      'name': '71: credit card'
    },
    4: {
      'id': 4,
      'name': '85: other credit card'
    }
  };
  this.budget = new bb.Budget();
  this.currentCategory = this.budget.categories[1];
  this.expense = new bb.Transaction();
  this.income = new bb.Transaction();
  this.page = new bb.Page(pageDom);
  this.transactions = [{
    'accountId': 1,
    'categories': [{
      'name': 'Food',
      'amount': 2.67
    }],
    'whenTimestamp': 1488720180,
    'who': "Dunkin' Donuts"
  }, {
    'accountId': 1,
    'categories': [{
      'name': 'Food',
      'amount': 2.99
    }, {
      'name': 'Household',
      'amount': 2.71
    }],
    'whenTimestamp': 1488639660,
    'who': 'Walmart'
  }, {
    'accountId': 3,
    'categories': [{
      'name': 'Household',
      'amount': 15.54
    }],
    'whenTimestamp': 1488639692,
    'who': "Lowe's"
  }, {
    'accountId': 1,
    'category': [{
      'name': 'Food',
      'amount': 2.30
    }],
    'whenTimestamp': 1488639592,
    'who': 'Chick-fil-A',
  }];
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
        'accounts': this.accounts,
        'transaction': this.expense
      }
    },
    'expense/amount': {
      'tagName': 'bb-page-expense-amount',
      'opts': {
        'transaction': this.expense
      }
    },
    'expense/category': {
      'tagName': 'bb-page-expense-category',
      'opts': {
        'categories': this.budget.categories,
        'transaction': this.expense
      }
    },
    'expense/summary': {
      'tagName': 'bb-page-expense-summary',
      'opts': {
        'accounts': this.accounts,
        'transaction': this.expense,
        'transactions': this.transactions,
      }
    },
    'expense/when': {
      'tagName': 'bb-page-expense-when',
      'opts': {
        'transaction': this.expense
      }
    },
    'expense/who': {
      'tagName': 'bb-page-expense-who',
      'opts': {
        'payees': this.budget.payees,
        'transaction': this.expense
      }
    },
    'history/account': {
      'tagName': 'bb-page-history-account',
      'opts': {
        'account': this.accounts[1],
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
        'transaction': this.income
      }
    },
    'income/amount': {
      'tagName': 'bb-page-income-amount',
      'opts': {
        'transaction': this.income
      }
    },
    'income/category': {
      'tagName': 'bb-page-income-category',
      'opts': {
        'categories': this.budget.categories
      }
    },
    'income/summary': {
      'tagName': 'bb-page-income-summary',
      'opts': {
        'accounts': this.accounts,
        'transaction': this.income,
        'transactions': this.transactions,
      }
    },
    'income/who': {
      'tagName': 'bb-page-income-who',
      'opts': {
        'incomeSources': this.budget.incomeSources,
        'transaction': this.income
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
