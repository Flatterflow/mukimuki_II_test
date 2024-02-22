import '/components/add_workout_box_button/add_workout_box_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // Model for addWorkoutBoxButton component.
  late AddWorkoutBoxButtonModel addWorkoutBoxButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    addWorkoutBoxButtonModel =
        createModel(context, () => AddWorkoutBoxButtonModel());
  }

  @override
  void dispose() {
    addWorkoutBoxButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
