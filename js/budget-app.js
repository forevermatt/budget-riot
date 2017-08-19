var bb = bb || {};

bb.BudgetApp = function(pageDom) {
  this.budget = new bb.Budget();
  this.dataStore = new bb.DataStore();

  this.accountService = new bb.DataService('accounts', this.dataStore);
  this.categoryService = new bb.DataService('categories', this.dataStore);
  this.transactionService = new bb.DataService('transactions', this.dataStore);

  this.expense = new bb.Transaction();
  this.income = new bb.Transaction();

  this.page = new bb.Page(pageDom);
  this.routes = {
    'accounts': {
      'tagName': 'bb-page-accounts',
      'opts': {
        'accountService': this.accountService
      }
    },
    'account/new': {
      'tagName': 'bb-page-account-new',
      'opts': {
        'accountService': this.accountService
      }
    },
    'budget': {
      'tagName': 'bb-page-budget',
      'opts': {
        'categoryService': this.categoryService
      }
    },
    'category/new': {
      'tagName': 'bb-page-category-new',
      'opts': {
        'categoryService': this.categoryService
      }
    },
    'expense/account': {
      'tagName': 'bb-page-expense-account',
      'opts': {
        'accountService': this.accountService,
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
        'categoryService': this.categoryService,
        'transaction': this.expense
      }
    },
    'expense/summary': {
      'tagName': 'bb-page-expense-summary',
      'opts': {
        'accountService': this.accountService,
        'transaction': this.expense,
        'transactionService': this.transactionService,
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
        'accountService': this.accountService,
        'transactionService': this.transactionService
      }
    },
    'history/all': {
      'tagName': 'bb-page-history-all',
      'opts': {
        'accountService': this.accountService,
        'transactionService': this.transactionService
      }
    },
    'history/category': {
      'tagName': 'bb-page-history-category',
      'opts': {
        'accountService': this.accountService,
        'categoryService': this.categoryService,
        'transactionService': this.transactionService
      }
    },
    'history/search': {
      'tagName': 'bb-page-history-search',
      'opts': {
        'accountService': this.accountService,
        'transactionService': this.transactionService
      }
    },
    'income/account': {
      'tagName': 'bb-page-income-account',
      'opts': {
        'accountService': this.accountService,
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
        'categoryService': this.categoryService,
        'transaction': this.income
      }
    },
    'income/summary': {
      'tagName': 'bb-page-income-summary',
      'opts': {
        'accountService': this.accountService,
        'transaction': this.income,
        'transactionService': this.transactionService,
      }
    },
    'income/when': {
      'tagName': 'bb-page-income-when',
      'opts': {
        'transaction': this.income
      }
    },
    'income/who': {
      'tagName': 'bb-page-income-who',
      'opts': {
        'transactionService': this.transactionService,
        'transaction': this.income
      }
    }
  };
  route(this.route.bind(this));
};

bb.BudgetApp.prototype.route = function(page, subPage, id) {
  if ( ! page) {
    route('budget');
    return;
  }

  var path = (subPage ? page + '/' + subPage : page);

  var routeData = this.routes[path];
  if (routeData != undefined) {
    if (routeData.opts == undefined) {
      routeData.opts = {};
    }
    if (id) {
      routeData.opts.id = Number(id);
    }
    try {
      this.page.showTag(routeData.tagName, routeData.opts);
    } catch (e) {
      console.log(e);
      this.page.showTag('bb-page-error', { 'error': e });
    }
  } else {
    this.page.showTag('bb-page-not-found', { 'route': path });
  }
};
