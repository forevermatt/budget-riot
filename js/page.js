var bb = bb || {};

bb.Page = function(pageDom) {
  this.buttons = [
    new bb.Button('expense', 'minus-sign', 'expense-who.html'),
    new bb.Button('income', 'plus-sign', 'income-who.html')
  ];
  this.pageDom = pageDom;
};

bb.Page.prototype.showTag = function(tagName, opts) {
  this.pageDom.innerHTML = '<' + tagName + ' />';
  riot.mount(tagName, opts);
};
