var bb = bb || {};

bb.Page = function() {
  this.buttons = [
    new bb.Button('expense', 'minus-sign', 'expense-who.html'),
    new bb.Button('income', 'plus-sign', 'income-who.html')
  ];
};
