var bb = bb || {};

bb.DataService = function(bucketName, dataStore) {
  this.dataStore = dataStore;
  this.bucketName = bucketName;
  this.dataStore.ensureBucketExists(bucketName);
};

bb.DataService.prototype.add = function(entry) {
  return this.dataStore.addEntryTo(this.bucketName, entry);
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

bb.DataService.prototype.getByName = function(name) {
  var collection = this.dataStore.getBucket(this.bucketName);
  var sanitizedName = String(name).trim();
  for (var id in collection) {
    if (collection.hasOwnProperty(id)) {
      var existingName = collection[id].name;
      if (existingName === sanitizedName) {
        return collection[id];
      }
    }
  }
  return null;
};

bb.DataService.prototype.getKeysFrom = function(id) {
  return Object.keys(this.getObjectById(id));
};

bb.DataService.prototype.getListById = function(id) {
  return this.getById(id) || [];
};

bb.DataService.prototype.getObjectById = function(id) {
  return this.getById(id) || {};
};

bb.DataService.prototype.isNameInUse = function(name) {
  return (this.getByName(name) !== null);
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

bb.DataService.prototype.setPropertyOfEntryTo = function(entryId, key, value) {
  var entry = this.getObjectById(entryId);
  entry[key] = value;
  this.dataStore.updateEntry(this.bucketName, entryId, entry);
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
