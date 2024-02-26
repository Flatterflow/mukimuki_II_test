// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CalorieCounterStruct extends FFFirebaseStruct {
  CalorieCounterStruct({
    int? calorieGoal,
    int? caloriesAte,
    int? caloriesBurnt,
    int? addCarb,
    int? addProtein,
    int? addFat,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _calorieGoal = calorieGoal,
        _caloriesAte = caloriesAte,
        _caloriesBurnt = caloriesBurnt,
        _addCarb = addCarb,
        _addProtein = addProtein,
        _addFat = addFat,
        super(firestoreUtilData);

  // "CalorieGoal" field.
  int? _calorieGoal;
  int get calorieGoal => _calorieGoal ?? 0;
  set calorieGoal(int? val) => _calorieGoal = val;
  void incrementCalorieGoal(int amount) => _calorieGoal = calorieGoal + amount;
  bool hasCalorieGoal() => _calorieGoal != null;

  // "CaloriesAte" field.
  int? _caloriesAte;
  int get caloriesAte => _caloriesAte ?? 0;
  set caloriesAte(int? val) => _caloriesAte = val;
  void incrementCaloriesAte(int amount) => _caloriesAte = caloriesAte + amount;
  bool hasCaloriesAte() => _caloriesAte != null;

  // "CaloriesBurnt" field.
  int? _caloriesBurnt;
  int get caloriesBurnt => _caloriesBurnt ?? 0;
  set caloriesBurnt(int? val) => _caloriesBurnt = val;
  void incrementCaloriesBurnt(int amount) =>
      _caloriesBurnt = caloriesBurnt + amount;
  bool hasCaloriesBurnt() => _caloriesBurnt != null;

  // "AddCarb" field.
  int? _addCarb;
  int get addCarb => _addCarb ?? 0;
  set addCarb(int? val) => _addCarb = val;
  void incrementAddCarb(int amount) => _addCarb = addCarb + amount;
  bool hasAddCarb() => _addCarb != null;

  // "addProtein" field.
  int? _addProtein;
  int get addProtein => _addProtein ?? 0;
  set addProtein(int? val) => _addProtein = val;
  void incrementAddProtein(int amount) => _addProtein = addProtein + amount;
  bool hasAddProtein() => _addProtein != null;

  // "addFat" field.
  int? _addFat;
  int get addFat => _addFat ?? 0;
  set addFat(int? val) => _addFat = val;
  void incrementAddFat(int amount) => _addFat = addFat + amount;
  bool hasAddFat() => _addFat != null;

  static CalorieCounterStruct fromMap(Map<String, dynamic> data) =>
      CalorieCounterStruct(
        calorieGoal: castToType<int>(data['CalorieGoal']),
        caloriesAte: castToType<int>(data['CaloriesAte']),
        caloriesBurnt: castToType<int>(data['CaloriesBurnt']),
        addCarb: castToType<int>(data['AddCarb']),
        addProtein: castToType<int>(data['addProtein']),
        addFat: castToType<int>(data['addFat']),
      );

  static CalorieCounterStruct? maybeFromMap(dynamic data) => data is Map
      ? CalorieCounterStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'CalorieGoal': _calorieGoal,
        'CaloriesAte': _caloriesAte,
        'CaloriesBurnt': _caloriesBurnt,
        'AddCarb': _addCarb,
        'addProtein': _addProtein,
        'addFat': _addFat,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'CalorieGoal': serializeParam(
          _calorieGoal,
          ParamType.int,
        ),
        'CaloriesAte': serializeParam(
          _caloriesAte,
          ParamType.int,
        ),
        'CaloriesBurnt': serializeParam(
          _caloriesBurnt,
          ParamType.int,
        ),
        'AddCarb': serializeParam(
          _addCarb,
          ParamType.int,
        ),
        'addProtein': serializeParam(
          _addProtein,
          ParamType.int,
        ),
        'addFat': serializeParam(
          _addFat,
          ParamType.int,
        ),
      }.withoutNulls;

  static CalorieCounterStruct fromSerializableMap(Map<String, dynamic> data) =>
      CalorieCounterStruct(
        calorieGoal: deserializeParam(
          data['CalorieGoal'],
          ParamType.int,
          false,
        ),
        caloriesAte: deserializeParam(
          data['CaloriesAte'],
          ParamType.int,
          false,
        ),
        caloriesBurnt: deserializeParam(
          data['CaloriesBurnt'],
          ParamType.int,
          false,
        ),
        addCarb: deserializeParam(
          data['AddCarb'],
          ParamType.int,
          false,
        ),
        addProtein: deserializeParam(
          data['addProtein'],
          ParamType.int,
          false,
        ),
        addFat: deserializeParam(
          data['addFat'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CalorieCounterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CalorieCounterStruct &&
        calorieGoal == other.calorieGoal &&
        caloriesAte == other.caloriesAte &&
        caloriesBurnt == other.caloriesBurnt &&
        addCarb == other.addCarb &&
        addProtein == other.addProtein &&
        addFat == other.addFat;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [calorieGoal, caloriesAte, caloriesBurnt, addCarb, addProtein, addFat]);
}

CalorieCounterStruct createCalorieCounterStruct({
  int? calorieGoal,
  int? caloriesAte,
  int? caloriesBurnt,
  int? addCarb,
  int? addProtein,
  int? addFat,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CalorieCounterStruct(
      calorieGoal: calorieGoal,
      caloriesAte: caloriesAte,
      caloriesBurnt: caloriesBurnt,
      addCarb: addCarb,
      addProtein: addProtein,
      addFat: addFat,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CalorieCounterStruct? updateCalorieCounterStruct(
  CalorieCounterStruct? calorieCounter, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    calorieCounter
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCalorieCounterStructData(
  Map<String, dynamic> firestoreData,
  CalorieCounterStruct? calorieCounter,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (calorieCounter == null) {
    return;
  }
  if (calorieCounter.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && calorieCounter.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final calorieCounterData =
      getCalorieCounterFirestoreData(calorieCounter, forFieldValue);
  final nestedData =
      calorieCounterData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = calorieCounter.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCalorieCounterFirestoreData(
  CalorieCounterStruct? calorieCounter, [
  bool forFieldValue = false,
]) {
  if (calorieCounter == null) {
    return {};
  }
  final firestoreData = mapToFirestore(calorieCounter.toMap());

  // Add any Firestore field values
  calorieCounter.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCalorieCounterListFirestoreData(
  List<CalorieCounterStruct>? calorieCounters,
) =>
    calorieCounters
        ?.map((e) => getCalorieCounterFirestoreData(e, true))
        .toList() ??
    [];
