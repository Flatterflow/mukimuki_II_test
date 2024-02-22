import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _wrkts = (await secureStorage.getStringList('ff_wrkts'))
              ?.map((x) {
                try {
                  return WorkoutStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _wrkts;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<WorkoutStruct> _wrkts = [];
  List<WorkoutStruct> get wrkts => _wrkts;
  set wrkts(List<WorkoutStruct> value) {
    _wrkts = value;
    secureStorage.setStringList(
        'ff_wrkts', value.map((x) => x.serialize()).toList());
  }

  void deleteWrkts() {
    secureStorage.delete(key: 'ff_wrkts');
  }

  void addToWrkts(WorkoutStruct value) {
    _wrkts.add(value);
    secureStorage.setStringList(
        'ff_wrkts', _wrkts.map((x) => x.serialize()).toList());
  }

  void removeFromWrkts(WorkoutStruct value) {
    _wrkts.remove(value);
    secureStorage.setStringList(
        'ff_wrkts', _wrkts.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromWrkts(int index) {
    _wrkts.removeAt(index);
    secureStorage.setStringList(
        'ff_wrkts', _wrkts.map((x) => x.serialize()).toList());
  }

  void updateWrktsAtIndex(
    int index,
    WorkoutStruct Function(WorkoutStruct) updateFn,
  ) {
    _wrkts[index] = updateFn(_wrkts[index]);
    secureStorage.setStringList(
        'ff_wrkts', _wrkts.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInWrkts(int index, WorkoutStruct value) {
    _wrkts.insert(index, value);
    secureStorage.setStringList(
        'ff_wrkts', _wrkts.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
