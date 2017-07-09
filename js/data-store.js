var bb = bb || {};

bb.DataStore = function() {
  var persistedData = window.localStorage.getItem('budgetAppData');
  if (persistedData == undefined) {
    this.data = {
      'accounts': {},
      'categories': {}
    };
    this.saveData();
  } else {
    this.data = JSON.parse(persistedData);
  }
};

bb.DataStore.prototype.addEntryTo = function(bucket, entry) {
  var newId;
  do {
    newId = Date.now();
  } while (this.hasEntryId(bucket, newId));
  entry.id = newId;
  this.data[bucket][newId] = entry;
  this.saveData();
};

bb.DataStore.prototype.ensureBucketExists = function(bucket) {
  if (this.data[bucket] == null) {
    this.data[bucket] = {};
    this.saveData();
  }
};

bb.DataStore.prototype.getBucket = function(bucket) {
  return this.data[bucket];
};

bb.DataStore.prototype.getEntryFrom = function(bucket, id) {
  return this.data[bucket][id];
};

bb.DataStore.prototype.hasEntryId = function(bucket, id) {
  return this.data[bucket].hasOwnProperty(id);
};

bb.DataStore.prototype.saveData = function() {
  window.localStorage.setItem('budgetAppData', JSON.stringify(this.data));
};

bb.DataStore.prototype.updateEntry = function(bucket, entry) {
  this.data[bucket][entry.id] = entry;
  this.saveData();
};
