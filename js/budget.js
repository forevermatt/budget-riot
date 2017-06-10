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
    { 'name': 'Citgo' },
    { 'name': 'Food Lion' },
    { 'name': 'Walmart' },
    { 'name': 'Bi-Lo' },
    { 'name': 'Harris Teeter' }
  ];
};
