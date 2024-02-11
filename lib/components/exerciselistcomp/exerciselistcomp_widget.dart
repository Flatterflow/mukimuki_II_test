import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'exerciselistcomp_model.dart';
export 'exerciselistcomp_model.dart';

class ExerciselistcompWidget extends StatefulWidget {
  const ExerciselistcompWidget({super.key});

  @override
  State<ExerciselistcompWidget> createState() => _ExerciselistcompWidgetState();
}

class _ExerciselistcompWidgetState extends State<ExerciselistcompWidget> {
  late ExerciselistcompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExerciselistcompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: FlutterFlowTheme.of(context).primary,
            offset: const Offset(0.0, 2.0),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  _model.total.toString(),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
            StreamBuilder<List<ExercisesRecord>>(
              stream: queryExercisesRecord(),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 35.0,
                      height: 35.0,
                      child: SpinKitSquareCircle(
                        color: FlutterFlowTheme.of(context).lineColor,
                        size: 35.0,
                      ),
                    ),
                  );
                }
                List<ExercisesRecord> listViewExercisesRecordList =
                    snapshot.data!;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewExercisesRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewExercisesRecord =
                        listViewExercisesRecordList[listViewIndex];
                    return Theme(
                      data: ThemeData(
                        checkboxTheme: const CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        unselectedWidgetColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                      child: CheckboxListTile(
                        value: _model.checkboxListTileValueMap[
                                listViewExercisesRecord] ??=
                            FFAppState()
                                .workout
                                .exerices
                                .map((e) => e.exerciseRef?.id)
                                .withoutNulls
                                .toList()
                                .contains(listViewExercisesRecord.reference.id),
                        onChanged: (newValue) async {
                          setState(() => _model.checkboxListTileValueMap[
                              listViewExercisesRecord] = newValue!);
                          if (newValue!) {
                            setState(() {
                              _model.total = _model.total + 1;
                            });
                            setState(() {
                              FFAppState().updateWorkoutStruct(
                                (e) => e
                                  ..updateExerices(
                                    (e) => e.add(ExerciseStruct(
                                      exerciseRef:
                                          listViewExercisesRecord.reference,
                                    )),
                                  ),
                              );
                            });
                          } else {
                            setState(() {
                              _model.total = _model.total + -1;
                            });
                          }
                        },
                        title: Text(
                          listViewExercisesRecord.name,
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                        subtitle: Text(
                          listViewExercisesRecord.muscleGroup,
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        checkColor: FlutterFlowTheme.of(context).info,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
