// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';

part 'homecubit_state.dart';

class HomecubitCubit extends Cubit<HomecubitState> {
  HomecubitCubit() : super(HomecubitInitial());

  final client = SupabaseClient('https://plxpluxkrgpwgkxotvfw.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBseHBsdXhrcmdwd2dreG90dmZ3Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY1NDQzNjg4OCwiZXhwIjoxOTcwMDEyODg4fQ.ujQYUbncM8RPbeeq3L3VPXQXKf0QWpqEeqLhC73LJpE');

  void getData() async {
    final stopwatch = Stopwatch()..start();

    final response = await client.from('countries').select().execute();
    print(response.data);

    print('GetData executed in ${stopwatch.elapsed.inMilliseconds} ms');
  }

  void insertData() async {
    final stopwatch = Stopwatch()..start();
    try {
      final res = await client.from('countries').insert([
        {'name': 'Philipines', 'capital_city': 'Manila'},
        {'name': 'Japan', 'capital_city': 'Tokyo'},
      ]).execute();
      print(res.data);

      print('InserData executed in ${stopwatch.elapsed.inMilliseconds} ms');
    } catch (e) {
      print("== error == $e");
    }
  }
}
