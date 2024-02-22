import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ExercisesRecord extends FirestoreRecord {
  ExercisesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "muscle_group" field.
  String? _muscleGroup;
  String get muscleGroup => _muscleGroup ?? '';
  bool hasMuscleGroup() => _muscleGroup != null;

  // "equipment" field.
  String? _equipment;
  String get equipment => _equipment ?? '';
  bool hasEquipment() => _equipment != null;

  // "sets" field.
  List<SetStruct>? _sets;
  List<SetStruct> get sets => _sets ?? const [];
  bool hasSets() => _sets != null;

  // "exerciseName" field.
  String? _exerciseName;
  String get exerciseName => _exerciseName ?? '';
  bool hasExerciseName() => _exerciseName != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _muscleGroup = snapshotData['muscle_group'] as String?;
    _equipment = snapshotData['equipment'] as String?;
    _sets = getStructList(
      snapshotData['sets'],
      SetStruct.fromMap,
    );
    _exerciseName = snapshotData['exerciseName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('exercises');

  static Stream<ExercisesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExercisesRecord.fromSnapshot(s));

  static Future<ExercisesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExercisesRecord.fromSnapshot(s));

  static ExercisesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExercisesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExercisesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExercisesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExercisesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExercisesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExercisesRecordData({
  String? name,
  String? muscleGroup,
  String? equipment,
  String? exerciseName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'muscle_group': muscleGroup,
      'equipment': equipment,
      'exerciseName': exerciseName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExercisesRecordDocumentEquality implements Equality<ExercisesRecord> {
  const ExercisesRecordDocumentEquality();

  @override
  bool equals(ExercisesRecord? e1, ExercisesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.muscleGroup == e2?.muscleGroup &&
        e1?.equipment == e2?.equipment &&
        listEquality.equals(e1?.sets, e2?.sets) &&
        e1?.exerciseName == e2?.exerciseName;
  }

  @override
  int hash(ExercisesRecord? e) => const ListEquality()
      .hash([e?.name, e?.muscleGroup, e?.equipment, e?.sets, e?.exerciseName]);

  @override
  bool isValidKey(Object? o) => o is ExercisesRecord;
}
