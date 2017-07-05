// convert a field's type from string to date
db.collectionName.find({ updatedAt: { $type: 2 } }).forEach(function(doc) {
  doc.updatedAt = ISODate(doc.updatedAt);
  db.collectionName.save(doc);
});

// rename a field
db.collectionName.update(
  { foo: 'bar' }, // condition
  { $rename: { 'oldName': 'newName' } },
  { multi: true }
);

// find duplicate values for a given (`name`) field
db.collectionName.aggregate(
  { $group: { _id: '$name', ids: { $addToSet: '$_id' }, count: { $sum: 1 } } },
  { $match: { _id: { $ne: null }, count: { $gt: 1 } } },
  { $project: { name: '$_id', _id: 0, ids: 1 } }
);

// remove a field based on a condition
db.collectionName.update(
  { userId: '123456'},
  { $unset: { userId: '' } },
  { multi: true }
);

// replace a given value in an array
db.collectionName.update(
  { fieldName: 'value' },
  { $set: { "fieldName.$" : 'newValue' } },
  { multi: true }
)
