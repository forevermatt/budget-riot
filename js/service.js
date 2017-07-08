var bb = bb || {};

bb.Service = function(bucketName, dataStore) {
  this.dataStore = dataStore;
  this.bucketName = bucketName;
  this.dataStore.ensureBucketExists(bucketName);
};

bb.Service.prototype.add = function(name) {
  this.dataStore.addEntryTo(this.bucketName, new bb.Category({
    'name': name
  }));
};

bb.Service.prototype.getAll = function() {
  return this.dataStore.getBucket(this.bucketName);
};

bb.Service.prototype.getById = function(categoryId) {
  return this.dataStore.getEntryFrom(this.bucketName, categoryId);
};

bb.Service.prototype.isNameInUse = function(name) {
  var collection = this.dataStore.getBucket(this.bucketName);
  var lcNewName = String(name).trim().toLowerCase();
  for (var id in collection) {
    if (collection.hasOwnProperty(id)) {
      var lcExistingName = collection[id].name.toLowerCase();
      if (lcExistingName === lcNewName) {
        return true;
      }
    }
  }
  return false;
};
