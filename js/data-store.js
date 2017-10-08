var bb = bb || {};

bb.DataStore = function() {
  var persistedData = window.localStorage.getItem('budgetAppData');
  if (persistedData == undefined) {
    this.initializeData();
  } else {
    this.data = JSON.parse(persistedData);
  }
  this.migrateData();
};

bb.DataStore.DATA_STRUCTURE_VERSION = '0.1.0';

bb.DataStore.prototype.addEntryTo = function(bucket, entry) {
  var newId;
  do {
    newId = String(Date.now());
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

bb.DataStore.prototype.initializeData = function() {
  this.data = {};
  this.saveData();
};

bb.DataStore.prototype.migrateData = function() {
  if (this.data.version == undefined) {
    this.data.version = bb.DataStore.DATA_STRUCTURE_VERSION;
  }
  this.saveData();
};

bb.DataStore.prototype.saveData = function() {
  window.localStorage.setItem('budgetAppData', JSON.stringify(this.data));
};

bb.DataStore.prototype.updateEntry = function(bucket, id, entry) {
  this.data[bucket][id] = entry;
  this.saveData();
};
