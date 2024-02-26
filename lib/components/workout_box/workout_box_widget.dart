import '/backend/backend.dart';
import '/components/workoutpopuot/workoutpopuot_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'workout_box_model.dart';
export 'workout_box_model.dart';

class WorkoutBoxWidget extends StatefulWidget {
  const WorkoutBoxWidget({
    super.key,
    String? workoutName,
    this.exerciseNames,
    required this.onDeleteAction,
    this.onUpdateAction,
    required this.index,
    required this.lastWorkout,
  }) : workoutName = workoutName ?? 'no';

  final String workoutName;
  final List<DocumentReference>? exerciseNames;
  final Future Function()? onDeleteAction;
  final Future Function()? onUpdateAction;
  final int? index;
  final WorkoutStruct? lastWorkout;

  @override
  State<WorkoutBoxWidget> createState() => _WorkoutBoxWidgetState();
}

class _WorkoutBoxWidgetState extends State<WorkoutBoxWidget> {
  late WorkoutBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutBoxModel());

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return WebViewAware(
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: const WorkoutpopuotWidget(),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      },
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).accent3,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StreamBuilder<List<HomepageGridTemplatesRecord>>(
                stream: queryHomepageGridTemplatesRecord(
                  singleRecord: true,
                ),
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
                  List<HomepageGridTemplatesRecord>
                      headerContainerHomepageGridTemplatesRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final headerContainerHomepageGridTemplatesRecord =
                      headerContainerHomepageGridTemplatesRecordList.isNotEmpty
                          ? headerContainerHomepageGridTemplatesRecordList.first
                          : null;
                  return Container(
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                headerContainerHomepageGridTemplatesRecord
                                    ?.name,
                                'TITLE',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title:
                                                        const Text('Delete Workout'),
                                                    content: const Text(
                                                        'Are you sure you want to delete this template'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: const Text('Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: const Text('Confirm'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      setState(() {
                                        FFAppState().removeAtIndexFromWrkts(
                                            widget.index!);
                                      });
                                      await widget.onDeleteAction?.call();
                                    }
                                  },
                                  child: Icon(
                                    Icons.edit_outlined,
                                    color: FlutterFlowTheme.of(context).accent2,
                                    size: 24.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              Expanded(
                child: StreamBuilder<List<HomepageGridTemplatesRecord>>(
                  stream: queryHomepageGridTemplatesRecord(
                    singleRecord: true,
                  ),
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
                    List<HomepageGridTemplatesRecord>
                        exerciseListContainerHomepageGridTemplatesRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final exerciseListContainerHomepageGridTemplatesRecord =
                        exerciseListContainerHomepageGridTemplatesRecordList
                                .isNotEmpty
                            ? exerciseListContainerHomepageGridTemplatesRecordList
                                .first
                            : null;
                    return Container(
                      decoration: const BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          final exerciseList =
                              exerciseListContainerHomepageGridTemplatesRecord
                                      ?.exerciseRef
                                      .toList() ??
                                  [];
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: exerciseList.length,
                            itemBuilder: (context, exerciseListIndex) {
                              final exerciseListItem =
                                  exerciseList[exerciseListIndex];
                              return Text(
                                valueOrDefault<String>(
                                  exerciseListContainerHomepageGridTemplatesRecord
                                      ?.hasExerciseRef()
                                      .toString(),
                                  '001',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 20.0,
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Text(
                        dateTimeFormat(
                          'yMMMd',
                          dateTimeFromSecondsSinceEpoch(valueOrDefault<int>(
                            widget.lastWorkout?.lastUsedDate?.secondsSinceEpoch,
                            00,
                          )),
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
