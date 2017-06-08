var bb = bb || {};

bb.Budget = function() {
  this.categories = [
    new bb.Category('Auto', 298,  400),
    new bb.Category('Food', 70, 300),
    new bb.Category('Household', -5, 200)
  ];
  this.incomeSources = [
    { 'url': '#income/amount', 'name': 'My Employer, Inc.' },
    { 'url': '#income/amount', 'name': 'Other Employer' },
    { 'url': '#income/amount', 'name': 'Joe Schmoe' }
  ];
  this.payees = [
    { 'url': '#expense/amount', 'name': 'Citgo' },
    { 'url': '#expense/amount', 'name': 'Food Lion' },
    { 'url': '#expense/amount', 'name': 'Walmart' },
    { 'url': '#expense/amount', 'name': 'Bi-Lo' },
    { 'url': '#expense/amount', 'name': 'Harris Teeter' }
  ];
};
