var bb = bb || {};

bb.Budget = function() {
  this.accounts = [{
    'name': '23: checking'
  }, {
    'name': '71: credit card'
  }, {
    'name': '85: other credit card'
  }, {
    'name': 'cash'
  }];
  this.categories = [
    new bb.Category('Auto', 298,  400),
    new bb.Category('Food', 70, 300),
    new bb.Category('Household', -5, 200)
  ];
};
