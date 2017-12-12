var bb = bb || {};

bb.BudgetApp = function(pageDom) {
  this.budget = new bb.Budget();
  this.dataManager = new bb.DataManager(new bb.DataStore());

  this.expense = new bb.Transaction();
  this.income = new bb.Transaction();

  this.page = new bb.Page(pageDom);
  this.routes = {
    'accounts': {
      'tagName': 'bb-page-accounts'
    },
    'account/new': {
      'tagName': 'bb-page-account-new'
    },
    'budget/view': {
      'tagName': 'bb-page-budget'
    },
    'category/amount': {
      'tagName': 'bb-page-category-amount'
    },
    'category/new': {
      'tagName': 'bb-page-category-new'
    },
    'expense/account': {
      'tagName': 'bb-page-expense-account',
      'opts': {
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
        'transaction': this.expense
      }
    },
    'expense/summary': {
      'tagName': 'bb-page-expense-summary',
      'opts': {
        'transaction': this.expense
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
        'transaction': this.expense
      }
    },
    'history/account': {
      'tagName': 'bb-page-history-account'
    },
    'history/all': {
      'tagName': 'bb-page-history-all'
    },
    'history/category': {
      'tagName': 'bb-page-history-category'
    },
    'history/search': {
      'tagName': 'bb-page-history-search'
    },
    'income/account': {
      'tagName': 'bb-page-income-account',
      'opts': {
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
        'transaction': this.income
      }
    },
    'income/summary': {
      'tagName': 'bb-page-income-summary',
      'opts': {
        'transaction': this.income
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
        'transaction': this.income
      }
    }
  };
  route(this.route.bind(this));
};

bb.BudgetApp.prototype.route = function(page, subPage, id) {
  if (!page) {
    route('budget');
    return;
  }

  if ((page === 'budget') && !subPage) {
    subPage = 'view';
  }

  var path = (subPage ? page + '/' + subPage : page);

  var routeData = this.routes[path];
  if (routeData != undefined) {
    routeData.opts = routeData.opts || {};
    routeData.opts.id = id;
    routeData.opts.dm = this.dataManager;
    try {
      this.page.showTag(routeData.tagName, routeData.opts);
    } catch (e) {
      console.error(e);
      this.page.showTag('bb-page-error', { 'error': e });
    }
  } else {
    this.page.showTag('bb-page-not-found', { 'route': path });
  }
};
