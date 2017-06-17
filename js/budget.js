var bb = bb || {};

bb.Budget = function() {
  this.categories = {
    1: new bb.Category(1, 'Auto', 298,  400),
    2: new bb.Category(2, 'Food', 70, 300),
    3: new bb.Category(3, 'Household', -5, 200)
  };
  this.incomeSources = [
    { 'url': '#income/amount', 'name': 'My Employer, Inc.' },
    { 'url': '#income/amount', 'name': 'Other Employer' },
    { 'url': '#income/amount', 'name': 'Joe Schmoe' }
  ];
  this.payees = [
    { 'name': 'Citgo' },
    { 'name': 'Food Lion' },
    { 'name': 'Walmart' },
    { 'name': 'Bi-Lo' },
    { 'name': 'Harris Teeter' }
  ];
};
