import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'add_workout_box_button_model.dart';
export 'add_workout_box_button_model.dart';

class AddWorkoutBoxButtonWidget extends StatefulWidget {
  const AddWorkoutBoxButtonWidget({
    super.key,
    required this.addWorkoutBoxAction,
  });

  final Future Function()? addWorkoutBoxAction;

  @override
  State<AddWorkoutBoxButtonWidget> createState() =>
      _AddWorkoutBoxButtonWidgetState();
}

class _AddWorkoutBoxButtonWidgetState extends State<AddWorkoutBoxButtonWidget>
    with TickerProviderStateMixin {
  late AddWorkoutBoxButtonModel _model;

  final animationsMap = {
    'iconButtonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.2, 1.2),
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
    _model = createModel(context, () => AddWorkoutBoxButtonModel());

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

    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      onEnter: ((event) async {
        setState(() => _model.mouseRegionHovered = true);
        if (animationsMap['iconButtonOnActionTriggerAnimation'] != null) {
          await animationsMap['iconButtonOnActionTriggerAnimation']!
              .controller
              .forward(from: 0.0);
        }
      }),
      onExit: ((event) async {
        setState(() => _model.mouseRegionHovered = false);
        if (animationsMap['iconButtonOnActionTriggerAnimation'] != null) {
          await animationsMap['iconButtonOnActionTriggerAnimation']!
              .controller
              .reverse();
        }
      }),
      child: FlutterFlowIconButton(
        borderRadius: 50.0,
        borderWidth: 0.0,
        buttonSize: 36.0,
        fillColor: FlutterFlowTheme.of(context).primary,
        icon: Icon(
          Icons.add,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 16.0,
        ),
        onPressed: () async {
          await widget.addWorkoutBoxAction?.call();
        },
      ).animateOnActionTrigger(
        animationsMap['iconButtonOnActionTriggerAnimation']!,
      ),
    );
  }
}
