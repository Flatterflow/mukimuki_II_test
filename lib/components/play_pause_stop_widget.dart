import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'play_pause_stop_model.dart';
export 'play_pause_stop_model.dart';

class PlayPauseStopWidget extends StatefulWidget {
  const PlayPauseStopWidget({
    super.key,
    bool? isPauseOn,
  }) : isPauseOn = isPauseOn ?? false;

  final bool isPauseOn;

  @override
  State<PlayPauseStopWidget> createState() => _PlayPauseStopWidgetState();
}

class _PlayPauseStopWidgetState extends State<PlayPauseStopWidget>
    with TickerProviderStateMixin {
  late PlayPauseStopModel _model;

  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(55.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayPauseStopModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowTimer(
                initialTime: _model.timerMilliseconds,
                getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                  value,
                  hours: false,
                  milliSecond: false,
                ),
                controller: _model.timerController,
                updateStateInterval: const Duration(milliseconds: 1000),
                onChanged: (value, displayTime, shouldUpdate) {
                  _model.timerMilliseconds = value;
                  _model.timerValue = displayTime;
                  if (shouldUpdate) setState(() {});
                },
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 48.0,
                height: 48.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  shape: BoxShape.circle,
                ),
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Icon(
                  Icons.stop_circle,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 36.0,
                ),
              ).animateOnActionTrigger(
                animationsMap['containerOnActionTriggerAnimation']!,
              ),
              Container(
                width: 48.0,
                height: 48.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  shape: BoxShape.circle,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Builder(
                      builder: (context) {
                        if (widget.isPauseOn == false) {
                          return Container(
                            width: 48.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              shape: BoxShape.circle,
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.timerController.onStopTimer();
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation'] !=
                                    null) {
                                  await animationsMap[
                                          'containerOnActionTriggerAnimation']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                              },
                              child: Icon(
                                Icons.pause_circle,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 36.0,
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            width: 48.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              shape: BoxShape.circle,
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.timerController.onStartTimer();
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation'] !=
                                    null) {
                                  await animationsMap[
                                          'containerOnActionTriggerAnimation']!
                                      .controller
                                      .reverse();
                                }
                              },
                              child: Icon(
                                Icons.play_circle,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 36.0,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ].divide(const SizedBox(width: 8.0)),
          ),
        ].divide(const SizedBox(width: 160.0)),
      ),
    );
  }
}
