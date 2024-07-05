import 'package:dashboardmophong2/backend/supabase/database/database.dart';
import 'package:dashboardmophong2/components/addingcard2/addingcard2_widget.dart';
import 'package:dashboardmophong2/flutter_flow/flutter_flow_widgets.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'giaovien_card_model.dart';
export 'giaovien_card_model.dart';

class GiaovienCardWidget extends StatefulWidget {
  final String tengiaovien;
  final String magiaovien;
  final String sdt;
  final String matrungtam;
  final String ghichu;
  final Function() reloadlist;

  const GiaovienCardWidget({
    super.key,
    required this.tengiaovien,
    required this.magiaovien,
    required this.sdt,
    required this.matrungtam,
    required this.reloadlist,
    required this.ghichu,
  });

  @override
  State<GiaovienCardWidget> createState() => _GiaovienCardWidgetState();
}

class _GiaovienCardWidgetState extends State<GiaovienCardWidget> {
  late GiaovienCardModel _model;

  get tengiaovien => widget.tengiaovien;
  get magiaovien => widget.magiaovien;
  get sdt => widget.sdt;
  get matrungtam => widget.matrungtam;
  get ghichu => widget.ghichu;

  @override
  void setState(VoidCallback callback) {
    _model.tengiaovien = tengiaovien;
    _model.magiaovien = magiaovien;
    _model.matrungtam = matrungtam;
    _model.sdt = sdt;
    _model.ghichu = ghichu;
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GiaovienCardModel());
    _model.tengiaovien = tengiaovien;
    _model.magiaovien = magiaovien;
    _model.matrungtam = matrungtam;
    _model.sdt = sdt;
    _model.ghichu = ghichu;
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
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 0,
              color: FlutterFlowTheme.of(context).lineColor,
              offset: Offset(
                0,
                1,
              ),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          /*FFLocalizations.of(context).getText(
                            '2x7ug0yu' /* Ten cua nguoi ay */,
                          ),*/
                          "${widget.tengiaovien}",
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
                        if (responsiveVisibility(
                          context: context,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                            child: Text(
                              /*FFLocalizations.of(context).getText(
                                '7trd0b01' /* user@domainname.com */,
                              ),*/
                              "${widget.magiaovien}",
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Expanded(
                  child: Text(
                    /*FFLocalizations.of(context).getText(
                      'ynm0bq42' /* huhuhuhu */,
                    ),*/
                    "${widget.magiaovien}",
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                Expanded(
                  child: Text(
                    /*FFLocalizations.of(context).getText(
                      'ohju1wje' /* sdfsdfsdfsdf */,
                    ),*/
                    "${widget.sdt}",
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Expanded(
                  child: Text(
                    /*FFLocalizations.of(context).getText(
                      '1lrlfpb7' /* sdfsfdsfsdfsdf */,
                    ),*/
                    "${widget.ghichu}",
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              Flexible(
                child: FFButtonWidget(
                  onPressed: () {
                    print("Xem và chỉnh sửa");
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Xem và chỉnh sửa thông tin giáo viên',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 24,
                                  letterSpacing: 0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          content: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Addingcard2Widget(
                                  tengiaovien: tengiaovien,
                                  magiaovien: magiaovien,
                                  sodienthoai: sdt,
                                  matrungtam: matrungtam,
                                  ghichu: ghichu,
                                  task: 'update',
                                  passdownvalue: (tengiaovien, magiaovien,
                                      sodienthoai, matrungtam, ghichu) async {
                                    setState(() {
                                      _model.tengiaovien = tengiaovien;
                                      _model.magiaovien = magiaovien;
                                      _model.sdt = sodienthoai;
                                      _model.matrungtam = matrungtam;
                                      _model.ghichu = ghichu;
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
                  text: /*FFLocalizations.of(context).getText(
                      'a89x3by5' /* Xem và chỉnh sửa */,
                    ),*/
                      "Xem chi tiết / Chỉnh sửa",
                  options: FFButtonOptions(
                    height: 40,
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
    );
  }
}
