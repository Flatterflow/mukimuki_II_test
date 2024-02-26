import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'workout1_model.dart';
export 'workout1_model.dart';

class Workout1Widget extends StatefulWidget {
  const Workout1Widget({super.key});

  @override
  State<Workout1Widget> createState() => _Workout1WidgetState();
}

class _Workout1WidgetState extends State<Workout1Widget> {
  late Workout1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Workout1Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('HomePage');
                },
                child: const Icon(
                  Icons.chevron_left_rounded,
                  color: Color(0xFF0F1113),
                  size: 32.0,
                ),
              ),
            ),
          ],
        ),
        title: Text(
          'Weightloss',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Outfit',
                color: const Color(0xFF0F1113),
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                        'assets/images/How-to-lose-weight-747x420.jpg',
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: 250.0,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Workout1',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Outfit',
                              color: const Color(0xFF0F1113),
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        'Video of showing what to do in order to \nlose weight.',
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Outfit',
                              color: const Color(0xFF57636C),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const Divider(
                        height: 32.0,
                        thickness: 1.0,
                        color: Color(0xFFDBE2E7),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(40.0, 20.0, 0.0, 24.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('Squat');
                      },
                      text: 'START',
                      options: FFButtonOptions(
                        width: 300.0,
                        height: 60.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFF4B39EF),
                        textStyle:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
