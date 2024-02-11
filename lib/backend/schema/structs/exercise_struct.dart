// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExerciseStruct extends FFFirebaseStruct {
  ExerciseStruct({
    DocumentReference? exerciseRef,
    SetStruct? sets,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _exerciseRef = exerciseRef,
        _sets = sets,
        super(firestoreUtilData);

  // "exerciseRef" field.
  DocumentReference? _exerciseRef;
  DocumentReference? get exerciseRef => _exerciseRef;
  set exerciseRef(DocumentReference? val) => _exerciseRef = val;
  bool hasExerciseRef() => _exerciseRef != null;

  // "sets" field.
  SetStruct? _sets;
  SetStruct get sets => _sets ?? SetStruct();
  set sets(SetStruct? val) => _sets = val;
  void updateSets(Function(SetStruct) updateFn) =>
      updateFn(_sets ??= SetStruct());
  bool hasSets() => _sets != null;

  static ExerciseStruct fromMap(Map<String, dynamic> data) => ExerciseStruct(
        exerciseRef: data['exerciseRef'] as DocumentReference?,
        sets: SetStruct.maybeFromMap(data['sets']),
      );

  static ExerciseStruct? maybeFromMap(dynamic data) =>
      data is Map ? ExerciseStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'exerciseRef': _exerciseRef,
        'sets': _sets?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'exerciseRef': serializeParam(
          _exerciseRef,
          ParamType.DocumentReference,
        ),
        'sets': serializeParam(
          _sets,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ExerciseStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExerciseStruct(
        exerciseRef: deserializeParam(
          data['exerciseRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['exercises'],
        ),
        sets: deserializeStructParam(
          data['sets'],
          ParamType.DataStruct,
          false,
          structBuilder: SetStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ExerciseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExerciseStruct &&
        exerciseRef == other.exerciseRef &&
        sets == other.sets;
  }

  @override
  int get hashCode => const ListEquality().hash([exerciseRef, sets]);
}

ExerciseStruct createExerciseStruct({
  DocumentReference? exerciseRef,
  SetStruct? sets,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ExerciseStruct(
      exerciseRef: exerciseRef,
      sets: sets ?? (clearUnsetFields ? SetStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ExerciseStruct? updateExerciseStruct(
  ExerciseStruct? exercise, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    exercise
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addExerciseStructData(
  Map<String, dynamic> firestoreData,
  ExerciseStruct? exercise,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (exercise == null) {
    return;
  }
  if (exercise.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && exercise.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final exerciseData = getExerciseFirestoreData(exercise, forFieldValue);
  final nestedData = exerciseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = exercise.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getExerciseFirestoreData(
  ExerciseStruct? exercise, [
  bool forFieldValue = false,
]) {
  if (exercise == null) {
    return {};
  }
  final firestoreData = mapToFirestore(exercise.toMap());

  // Handle nested data for "sets" field.
  addSetStructData(
    firestoreData,
    exercise.hasSets() ? exercise.sets : null,
    'sets',
    forFieldValue,
  );

  // Add any Firestore field values
  exercise.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getExerciseListFirestoreData(
  List<ExerciseStruct>? exercises,
) =>
    exercises?.map((e) => getExerciseFirestoreData(e, true)).toList() ?? [];
