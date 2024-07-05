import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:uuid/uuid.dart';

class TrungTamAPI {
  final String baseUrl = 'http://handtaitechmophong.zapto.org:3000/v1/trungtam';
  Future<dynamic> getTrungTamById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Trung Tam by Id');
    }
  }

  Future<dynamic> getTrungTamByEmail(String Email) async {
    final response =
        await http.get(Uri.parse('$baseUrl/authtrungtambyEmail/$Email'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Trung Tam by Email  ');
    }
  }

  Future<dynamic> getTrungTamLISTHS(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id/listHS'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Hoc Vien Trung Tam');
    }
  }

  Future<dynamic> getTrungTamLISTGV(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id/listGV'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Hoc Vien Trung Tam');
    }
  }

  Future<dynamic> updateTrungTam(String id, Map<String, dynamic> body) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update Trung Tam');
    }
  }

  Future<dynamic> deleteTrungTam(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to delete Trung Tam');
    }
  }
}

class GiaoVienAPI {
  final String baseUrl = 'http://handtaitechmophong.zapto.org:3000/v1/giaovien';
  Future<dynamic> createGiaoVien(Map<String, dynamic> giaoVienBody) async {
    final response = await http.post(
      Uri.parse('$baseUrl'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'matrungtam': giaoVienBody['matrungtam'],
        'magiaovien': giaoVienBody['magiaovien'],
        'tengiaovien': giaoVienBody['tengiaovien'],
        'sodienthoai': giaoVienBody['sodienthoai'],
        'ghichu': giaoVienBody['ghichu'],
      }),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  Future<dynamic> updateGiaoVien(
      Map<String, dynamic> giaoVienBody, String id) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'matrungtam': giaoVienBody['matrungtam'],
        'magiaovien': giaoVienBody['magiaovien'],
        'tengiaovien': giaoVienBody['tengiaovien'],
        'sodienthoai': giaoVienBody['sodienthoai'],
        'ghichu': giaoVienBody['ghichu'],
      }),
    );

    if (response.statusCode == 202) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  Future<dynamic> authgiaovien(String magiaovien) async {
    final response = await http.get(
      Uri.parse('$baseUrl/authgiaovien/$magiaovien'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load giao vien by ma giao vien');
    }
  }
}

class HocVienAPI {
  final String baseUrl = 'http://handtaitechmophong.zapto.org:3000/v1/hocvien';
  Future<dynamic> createHocVien(Map<String, dynamic> hocVienBody) async {
    final response = await http.post(
      Uri.parse('$baseUrl'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'mahocvien': hocVienBody['mahocvien'],
        'matrungtam': hocVienBody['matrungtam'],
        'magiaovienquanly': hocVienBody['magiaovienquanly'],
        'tenhocvien': hocVienBody['tenhocvien'],
        'sodienthoai': hocVienBody['sodienthoai'],
        'email': hocVienBody['email'],
        'kichhoat': hocVienBody['kichhoat'],
        'datotnghiep': hocVienBody['datotnghiep'],
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  Future<dynamic> updateHocVien(
      Map<String, dynamic> hocVienBody, String id) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'mahocvien': hocVienBody['mahocvien'],
        'matrungtam': hocVienBody['matrungtam'],
        'magiaovienquanly': hocVienBody['magiaovienquanly'],
        'tenhocvien': hocVienBody['tenhocvien'],
        'sodienthoai': hocVienBody['sodienthoai'],
        'email': hocVienBody['email'],
        'kichhoat': hocVienBody['kichhoat'],
        'datotnghiep': hocVienBody['datotnghiep'],
      }),
    );

    if (response.statusCode == 202) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  Future<dynamic> authhocvien(String mahocvien) async {
    final response = await http.get(
      Uri.parse('$baseUrl/authhocvien/$mahocvien'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Trung Tam by Id');
    }
  }
}

TrungTamAPI trungTamAPI = TrungTamAPI();
GiaoVienAPI giaoVienAPI = GiaoVienAPI();
HocVienAPI hocVienAPI = HocVienAPI();
var Listhocvien = [];
var Listgiaovien = [];
