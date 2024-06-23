import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'hocvien_card_widget.dart' show HocvienCardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HocvienCardModel extends FlutterFlowModel<HocvienCardWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CheckboxListTile widget.
  //bool? checkboxListTileValue;
  bool? kichhoat;
  String? tenhocvien;
  String? mahocvien;
  String? sdt;
  String? tengiaovien;
  String? magiaovien;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
