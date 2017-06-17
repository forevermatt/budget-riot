var bb = bb || {};

bb.Date = function() {
};

bb.Date.format = function(timestamp) {
  return (new Date(timestamp)).toLocaleDateString();
};

bb.Date.short = function(timestamp) {
  var date = new Date(timestamp);
  return (date.getMonth() + 1) + '/' + date.getDate();
};
