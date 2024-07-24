import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://pezwalqtfgvpfqtqfqbt.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBlendhbHF0Zmd2cGZxdHFmcWJ0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjE4MzQ4OTQsImV4cCI6MjAzNzQxMDg5NH0.FcYfLPUyP0yft1ZViuq_92nKp4kIpY6dG3KES0FBLHE';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
