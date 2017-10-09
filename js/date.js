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
  var fullYear = desiredDate.getFullYear();
  var desiredMonth = (desiredDate.getMonth() + 1); // 1 to 12
  return fullYear + '-' + String('0' + desiredMonth).slice(-2);
};

bb.Date.short = function(timestamp) {
  var date = new Date(timestamp);
  return (date.getMonth() + 1) + '/' + date.getDate();
};
