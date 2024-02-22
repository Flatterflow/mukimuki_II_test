// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkoutStruct extends FFFirebaseStruct {
  WorkoutStruct({
    String? name,
    List<ExerciseStruct>? exerices,
    DateTime? lastUsedDate,
    List<WorkoutStruct>? workoutTemplates,
    bool? isNew,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _exerices = exerices,
        _lastUsedDate = lastUsedDate,
        _workoutTemplates = workoutTemplates,
        _isNew = isNew,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "exerices" field.
  List<ExerciseStruct>? _exerices;
  List<ExerciseStruct> get exerices => _exerices ?? const [];
  set exerices(List<ExerciseStruct>? val) => _exerices = val;
  void updateExerices(Function(List<ExerciseStruct>) updateFn) =>
      updateFn(_exerices ??= []);
  bool hasExerices() => _exerices != null;

  // "LastUsedDate" field.
  DateTime? _lastUsedDate;
  DateTime? get lastUsedDate => _lastUsedDate;
  set lastUsedDate(DateTime? val) => _lastUsedDate = val;
  bool hasLastUsedDate() => _lastUsedDate != null;

  // "workoutTemplates" field.
  List<WorkoutStruct>? _workoutTemplates;
  List<WorkoutStruct> get workoutTemplates => _workoutTemplates ?? const [];
  set workoutTemplates(List<WorkoutStruct>? val) => _workoutTemplates = val;
  void updateWorkoutTemplates(Function(List<WorkoutStruct>) updateFn) =>
      updateFn(_workoutTemplates ??= []);
  bool hasWorkoutTemplates() => _workoutTemplates != null;

  // "isNew" field.
  bool? _isNew;
  bool get isNew => _isNew ?? false;
  set isNew(bool? val) => _isNew = val;
  bool hasIsNew() => _isNew != null;

  static WorkoutStruct fromMap(Map<String, dynamic> data) => WorkoutStruct(
        name: data['name'] as String?,
        exerices: getStructList(
          data['exerices'],
          ExerciseStruct.fromMap,
        ),
        lastUsedDate: data['LastUsedDate'] as DateTime?,
        workoutTemplates: getStructList(
          data['workoutTemplates'],
          WorkoutStruct.fromMap,
        ),
        isNew: data['isNew'] as bool?,
      );

  static WorkoutStruct? maybeFromMap(dynamic data) =>
      data is Map ? WorkoutStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'exerices': _exerices?.map((e) => e.toMap()).toList(),
        'LastUsedDate': _lastUsedDate,
        'workoutTemplates': _workoutTemplates?.map((e) => e.toMap()).toList(),
        'isNew': _isNew,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'exerices': serializeParam(
          _exerices,
          ParamType.DataStruct,
          true,
        ),
        'LastUsedDate': serializeParam(
          _lastUsedDate,
          ParamType.DateTime,
        ),
        'workoutTemplates': serializeParam(
          _workoutTemplates,
          ParamType.DataStruct,
          true,
        ),
        'isNew': serializeParam(
          _isNew,
          ParamType.bool,
        ),
      }.withoutNulls;

  static WorkoutStruct fromSerializableMap(Map<String, dynamic> data) =>
      WorkoutStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        exerices: deserializeStructParam<ExerciseStruct>(
          data['exerices'],
          ParamType.DataStruct,
          true,
          structBuilder: ExerciseStruct.fromSerializableMap,
        ),
        lastUsedDate: deserializeParam(
          data['LastUsedDate'],
          ParamType.DateTime,
          false,
        ),
        workoutTemplates: deserializeStructParam<WorkoutStruct>(
          data['workoutTemplates'],
          ParamType.DataStruct,
          true,
          structBuilder: WorkoutStruct.fromSerializableMap,
        ),
        isNew: deserializeParam(
          data['isNew'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'WorkoutStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WorkoutStruct &&
        name == other.name &&
        listEquality.equals(exerices, other.exerices) &&
        lastUsedDate == other.lastUsedDate &&
        listEquality.equals(workoutTemplates, other.workoutTemplates) &&
        isNew == other.isNew;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, exerices, lastUsedDate, workoutTemplates, isNew]);
}

WorkoutStruct createWorkoutStruct({
  String? name,
  DateTime? lastUsedDate,
  bool? isNew,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WorkoutStruct(
      name: name,
      lastUsedDate: lastUsedDate,
      isNew: isNew,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WorkoutStruct? updateWorkoutStruct(
  WorkoutStruct? workout, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    workout
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWorkoutStructData(
  Map<String, dynamic> firestoreData,
  WorkoutStruct? workout,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (workout == null) {
    return;
  }
  if (workout.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && workout.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final workoutData = getWorkoutFirestoreData(workout, forFieldValue);
  final nestedData = workoutData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = workout.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWorkoutFirestoreData(
  WorkoutStruct? workout, [
  bool forFieldValue = false,
]) {
  if (workout == null) {
    return {};
  }
  final firestoreData = mapToFirestore(workout.toMap());

  // Add any Firestore field values
  workout.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWorkoutListFirestoreData(
  List<WorkoutStruct>? workouts,
) =>
    workouts?.map((e) => getWorkoutFirestoreData(e, true)).toList() ?? [];
