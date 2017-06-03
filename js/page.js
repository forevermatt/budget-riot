var bb = bb || {};

bb.Page = function(pageDom) {
  this.pageDom = pageDom;
};

bb.Page.prototype.showTag = function(tagName, opts) {
  this.pageDom.innerHTML = '<' + tagName + ' />';
  riot.mount(tagName, opts);
};
