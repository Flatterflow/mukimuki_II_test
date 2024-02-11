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

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _exerciseRef = getDataList(snapshotData['exerciseRef']);
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
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
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
        listEquality.equals(e1?.exerciseRef, e2?.exerciseRef);
  }

  @override
  int hash(HomepageGridTemplatesRecord? e) =>
      const ListEquality().hash([e?.name, e?.exerciseRef]);

  @override
  bool isValidKey(Object? o) => o is HomepageGridTemplatesRecord;
}
