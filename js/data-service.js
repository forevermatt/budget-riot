var bb = bb || {};

bb.DataService = function(bucketName, dataStore) {
  this.dataStore = dataStore;
  this.bucketName = bucketName;
  this.dataStore.ensureBucketExists(bucketName);
};

bb.DataService.prototype.add = function(entry) {
  this.dataStore.addEntryTo(this.bucketName, entry);
};

bb.DataService.prototype.addToList = function(id, entry) {
  var list = this.getById(id);
  if (list == null) {
    list = [];
  }
  list.push(entry);
  this.dataStore.updateEntry(this.bucketName, id, list);
};

bb.DataService.prototype.getAll = function() {
  return this.dataStore.getBucket(this.bucketName);
};

bb.DataService.prototype.getById = function(id) {
  return this.dataStore.getEntryFrom(this.bucketName, id);
};

bb.DataService.prototype.getListById = function(id) {
  return this.getById(id) || [];
};

bb.DataService.prototype.isNameInUse = function(name) {
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

bb.DataService.prototype.rename = function(id, newName) {
  var entry = this.getById(id);
  if (this.isNameInUse(newName)) {
    alert('You already have one named "' + newName + '".');
  } else {
    entry.name = newName;
    this.dataStore.updateEntry(this.bucketName, id, entry);
  }
};

bb.DataService.prototype.update = function(revisedEntry) {
  if (revisedEntry.id == null) {
    console.error('No id found on revised entry.', revisedEntry);
    alert("There was a problem trying to save that change... I'm sorry.");
  } else {
    var entry = this.getById(revisedEntry.id);
    this.dataStore.updateEntry(this.bucketName, revisedEntry.id, revisedEntry);
  }
};
