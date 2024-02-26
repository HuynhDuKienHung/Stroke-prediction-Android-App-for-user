import 'package:app_benh_nhan/models/myuser.dart';
import 'package:app_benh_nhan/screens/wrapper.dart';
import 'package:app_benh_nhan/services/auth.dart'; 
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<GetUser?>.value(
      value: AuthService().user,
      initialData: null,
      catchError: (context, error) {
        // Xử lý ngoại lệ tại đây
        print('Error from StreamProvider: $error');
        return null; // hoặc giá trị mặc định khác tùy vào yêu cầu của bạn
      },
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
