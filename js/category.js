var bb = bb || {};

bb.Category = function(id, name, remaining, total) {
  this.id = id;
  this.name = name;
  this.remaining = remaining || 0;
  this.total = total || 0;
};
