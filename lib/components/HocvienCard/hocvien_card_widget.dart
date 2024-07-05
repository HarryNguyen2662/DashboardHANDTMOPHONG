import 'package:dashboardmophong2/backend/API/API_trungtam.dart';
import 'package:dashboardmophong2/components/addingcard/addingcard_widget.dart';

import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'hocvien_card_model.dart';
export 'hocvien_card_model.dart';

class HocvienCardWidget extends StatefulWidget {
  String tenhocvien;
  String mahocvien;
  String sdt;
  String tengiaovien;
  String magiaovien;
  bool kichhoat;
  final Function() reloadlist;

  HocvienCardWidget({
    Key? key,
    required this.tenhocvien,
    required this.mahocvien,
    required this.sdt,
    required this.tengiaovien,
    required this.magiaovien,
    required this.kichhoat,
    required this.reloadlist,
  }) : super(key: key);

  @override
  State<HocvienCardWidget> createState() => _HocvienCardWidgetState();
}

class _HocvienCardWidgetState extends State<HocvienCardWidget>
    with TickerProviderStateMixin {
  late HocvienCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  get tenhocvien => widget.tenhocvien;
  get mahocvien => widget.mahocvien;
  get sdt => widget.sdt;
  get tengiaovien => widget.tengiaovien;
  get magiaovien => widget.magiaovien;
  get kichhoat => widget.kichhoat;

  @override
  void setState(VoidCallback callback) {
    _model.tenhocvien = tenhocvien;
    _model.mahocvien = mahocvien;
    _model.magiaovien = magiaovien;
    _model.sdt = sdt;
    _model.kichhoat = kichhoat;
    _model.tengiaovien = tengiaovien;
    super.setState(callback);
    _model.onUpdate();
  }

  Future<void> gettengiaovien() async {
    giaoVienAPI.authgiaovien(magiaovien).then((value) {
      setState(() {
        _model.tengiaovien = value[0]["ten_giao_vien"];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HocvienCardModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
    _model.tenhocvien = tenhocvien;
    _model.mahocvien = mahocvien;
    _model.magiaovien = magiaovien;
    _model.sdt = sdt;
    _model.kichhoat = kichhoat;
    _model.tengiaovien = tengiaovien;
    gettengiaovien();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Color(0x20000000),
                offset: Offset(
                  0.0,
                  1,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(12),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 12, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                        child: Text(
                          "Học viên : ${_model.tenhocvien}",
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                letterSpacing: 0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleMediumFamily),
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 2, 0, 0),
                        child: Text(
                          "Mã học viên : ${_model.mahocvien}",
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodySmallFamily,
                                letterSpacing: 0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodySmallFamily),
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                        child: Text(
                          "Số điện thoại : ${_model.sdt}",
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodySmallFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 12,
                                letterSpacing: 0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodySmallFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 2, 0, 0),
                          child: Text(
                            "Giáo viên hướng dẫn : ${_model.tengiaovien}",
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodySmallFamily,
                                  letterSpacing: 0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodySmallFamily),
                                ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 2, 0, 0),
                          child: Text(
                            "Mã giáo viên : ${_model.magiaovien}",
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodySmallFamily,
                                  letterSpacing: 0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodySmallFamily),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      unselectedWidgetColor:
                          FlutterFlowTheme.of(context).secondaryText,
                    ),
                    child: CheckboxListTile(
                      value: _model.kichhoat ??= false,
                      onChanged: (newValue) async {
                        setState(() {
                          _model.kichhoat = newValue!;
                        });
                      },
                      title: Text(
                        "kích hoạt",
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleLargeFamily,
                              letterSpacing: 0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleLargeFamily),
                            ),
                      ),
                      //tileColor:
                      //    FlutterFlowTheme.of(context).secondaryBackground,
                      activeColor: FlutterFlowTheme.of(context).primary,
                      checkColor: FlutterFlowTheme.of(context).info,
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  ),
                ),
                Expanded(
                  child: FFButtonWidget(
                    onPressed: () async {
                      print("Xem và chỉnh sửa");
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Xem và chỉnh sửa thông tin học viên',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 24,
                                    letterSpacing: 0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            content: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  AddingcardWidget(
                                    tenhocvien: tenhocvien,
                                    mahocvien: mahocvien,
                                    magiaovienquanly: magiaovien,
                                    sodienthoai: sdt,
                                    kichhoat: kichhoat,
                                    task: "update",
                                    passdownvalue: (tenhocvien,
                                        mahocvien,
                                        magiaovienquanly,
                                        sodienthoai,
                                        kichhoat) async {
                                      setState(() {
                                        _model.tenhocvien = tenhocvien;
                                        _model.mahocvien = mahocvien;
                                        _model.magiaovien = magiaovienquanly;
                                        _model.sdt = sodienthoai;
                                        _model.kichhoat = kichhoat;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ).then((_) async {
                        await widget.reloadlist();
                      });
                    },
                    text: "Xem chi tiết / Chỉnh sửa",
                    options: FFButtonOptions(
                      height: 40,
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Colors.white,
                            letterSpacing: 0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
