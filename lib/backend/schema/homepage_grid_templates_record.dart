import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class HomepageGridTemplatesRecord extends FirestoreRecord {
  HomepageGridTemplatesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "exerciseRef" field.
  List<DocumentReference>? _exerciseRef;
  List<DocumentReference> get exerciseRef => _exerciseRef ?? const [];
  bool hasExerciseRef() => _exerciseRef != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _exerciseRef = getDataList(snapshotData['exerciseRef']);
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('homepage_grid_templates');

  static Stream<HomepageGridTemplatesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => HomepageGridTemplatesRecord.fromSnapshot(s));

  static Future<HomepageGridTemplatesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => HomepageGridTemplatesRecord.fromSnapshot(s));

  static HomepageGridTemplatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HomepageGridTemplatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HomepageGridTemplatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HomepageGridTemplatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HomepageGridTemplatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HomepageGridTemplatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHomepageGridTemplatesRecordData({
  String? name,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class HomepageGridTemplatesRecordDocumentEquality
    implements Equality<HomepageGridTemplatesRecord> {
  const HomepageGridTemplatesRecordDocumentEquality();

  @override
  bool equals(
      HomepageGridTemplatesRecord? e1, HomepageGridTemplatesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.exerciseRef, e2?.exerciseRef) &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(HomepageGridTemplatesRecord? e) =>
      const ListEquality().hash([e?.name, e?.exerciseRef, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is HomepageGridTemplatesRecord;
}
