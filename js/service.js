var bb = bb || {};

bb.Service = function(bucketName, dataStore) {
  this.dataStore = dataStore;
  this.bucketName = bucketName;
  this.dataStore.ensureBucketExists(bucketName);
};

bb.Service.prototype.add = function(entry) {
  this.dataStore.addEntryTo(this.bucketName, entry);
};

bb.Service.prototype.getAll = function() {
  return this.dataStore.getBucket(this.bucketName);
};

bb.Service.prototype.getById = function(id) {
  return this.dataStore.getEntryFrom(this.bucketName, id);
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

bb.Service.prototype.rename = function(id, newName) {
  var entry = this.getById(id);
  if (this.isNameInUse(newName)) {
    alert('You already have one named "' + newName + '".');
  } else {
    entry.name = newName;
    this.dataStore.updateEntry(this.bucketName, id, entry);
  }
};
