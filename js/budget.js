var bb = bb || {};

bb.Budget = function() {
  this.categories = [
    new bb.Category('Auto', 298,  400),
    new bb.Category('Food', 70, 300),
    new bb.Category('Household', -5, 200)
  ];
};
