var bb = bb || {};

bb.Date = function() {
};

bb.Date.format = function(timestamp) {
  return (new Date(timestamp)).toLocaleDateString();
};
