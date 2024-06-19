import 'dart:convert';

import 'package:dashboardmophong2/backend/API/API_trungtam.dart';
import 'package:rxdart/rxdart.dart';

import '/backend/supabase/supabase.dart';
import '../base_auth_user_provider.dart';

export '../base_auth_user_provider.dart';

String idtam = "tamtamtam";

class Dashboardmophong2SupabaseUser extends BaseAuthUser {
  Dashboardmophong2SupabaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;

  Future<String> getID_and_info(String? email) async {
    var id = '';
    var result = await trungTamAPI.getTrungTamByEmail(email!);
    id = result[0]['id'];
    idtam = id;
    if (Listhocvien.length == 0) {
      Listhocvien = await trungTamAPI.getTrungTamLISTHS(idtam);
    }
    if (Listgiaovien.length == 0) {
      Listgiaovien = await trungTamAPI.getTrungTamLISTGV(idtam);
    }
    return id;
  }

  Future<AuthUserInfo> getAuthUserInfo() async {
    if (user == null) {
      throw Exception('User is null');
    }
    var id = await getID_and_info(user!.email);
    return AuthUserInfo(
      uid: user?.id,
      email: user?.email,
      phoneNumber: user?.phone,
      id: id,
    );
  }

  AuthUserInfo getAuthUserInfotoGetter() {
    if (idtam == "tamtamtam") {
      getAuthUserInfo().then(
        (value) {
          return value;
        },
      );
    }
    return AuthUserInfo(
      uid: user?.id,
      email: user?.email,
      phoneNumber: user?.phone,
      id: idtam,
    );
  }

  @override
  AuthUserInfo get authUserInfo => getAuthUserInfotoGetter();

  @override
  Future? delete() =>
      throw UnsupportedError('The delete user operation is not yet supported.');

  @override
  Future? updateEmail(String email) async {
    final response =
        await SupaFlow.client.auth.updateUser(UserAttributes(email: email));
    if (response.user != null) {
      user = response.user;
    }
  }

  @override
  Future? sendEmailVerification() => throw UnsupportedError(
      'The send email verification operation is not yet supported.');

  @override
  bool get emailVerified {
    // Reloads the user when checking in order to get the most up to date
    // email verified status.
    if (loggedIn && user!.emailConfirmedAt == null) {
      refreshUser();
    }
    return user?.emailConfirmedAt != null;
  }

  @override
  Future refreshUser() async {
    await SupaFlow.client.auth
        .refreshSession()
        .then((_) => user = SupaFlow.client.auth.currentUser);
  }
}

/// Generates a stream of the authenticated user.
/// [SupaFlow.client.auth.onAuthStateChange] does not yield any values until the
/// user is already authenticated. So we add a default null user to the stream,
/// if we need to interact with the [currentUser] before logging in.
Stream<BaseAuthUser> dashboardmophong2SupabaseUserStream() {
  final supabaseAuthStream = SupaFlow.client.auth.onAuthStateChange.debounce(
      (authState) => authState.event == AuthChangeEvent.tokenRefreshed
          ? TimerStream(authState, Duration(seconds: 1))
          : Stream.value(authState));
  return (!loggedIn
          ? Stream<AuthState?>.value(null).concatWith([supabaseAuthStream])
          : supabaseAuthStream)
      .map<BaseAuthUser>(
    (authState) {
      currentUser = Dashboardmophong2SupabaseUser(authState?.session?.user);
      return currentUser!;
    },
  );
}
