var bb = bb || {};

bb.Date = function() {
};

bb.Date.format = function(timestamp) {
  return (new Date(timestamp)).toLocaleDateString();
};

bb.Date.getCurrentYearMonthString = function() {
  return this.getYearMonthStringForMonthsBefore(0, new Date());
};

bb.Date.getYearMonthStringForMonthsBefore = function(numMonthsAgo, when) {
  var currentYear = when.getFullYear();
  var currentMonth = when.getMonth(); // 0 to 11
  var desiredDate = new Date(currentYear, currentMonth - numMonthsAgo);
  return desiredDate.getFullYear() + '-' + (desiredDate.getMonth() + 1); // 1 to 12
};

bb.Date.short = function(timestamp) {
  var date = new Date(timestamp);
  return (date.getMonth() + 1) + '/' + date.getDate();
};
