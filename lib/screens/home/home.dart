import 'package:app_benh_nhan/models/user_model.dart';
import 'package:app_benh_nhan/screens/home/Settings_form.dart';
import 'package:app_benh_nhan/screens/home/model.dart';
import 'package:app_benh_nhan/services/auth.dart';
import 'package:app_benh_nhan/services/database.dart'; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';        

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    void showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              child: const SettingsForm(),
            );
          });
    }

    void showmlpage() {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return const HTTP();
          });
    }

    return StreamProvider<List<UserModel>?>.value(
      value: DatabaseService().Collection,
      initialData: null,
      catchError: (context, error) {
        // Xử lý ngoại lệ tại đây
        print('Error from StreamProvider: $error');
        return null; // hoặc giá trị mặc định khác tùy vào yêu cầu của bạn
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: const Text('Trang Chính'),
            backgroundColor: Colors.white,
            elevation: 0.0,
            actions: <Widget>[
              TextButton.icon(
                icon:
                    const Icon(Icons.medical_services_outlined, color: Colors.black),
                label: const Text(
                  '',
                ),
                onPressed: () => showmlpage(),
              ),
              TextButton.icon(
                icon: const Icon(Icons.person, color: Colors.black),
                label: const Text(
                  '',
                ),
                onPressed: () => showSettingsPanel(),
              ),
              TextButton.icon(
                  icon: const Icon(Icons.logout_outlined, color: Colors.black),
                  label: const Text(
                    'logout',
                  ),
                  onPressed: () async {
                    await _auth.signOut();
                  }),
            ]),
        body: Container(
          child: Column(
            children: [
              const Text(
                'Hướng dẫn quan trọng\nCHO VIỆC ĐO HUYẾT ÁP',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 86, 146),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: 20,
                    bottom: 20,
                    right: 20,
                    top: 0), //apply padding to some sides only
                child: Text(
                  '\t1.Không nên ăn, tập thể thao hoặc tắm trong 30 phút trước khi tiến hành do huyết áp\n2.Nên ngồi nghỉ ngơi trong môi trường yên tĩnh trước khi đo khoảng 5 phút\n3.Không nên đứng khi đo huyết áp\n4.Không nói chuyện hoặc di chuyển trong suốt quá trình đo',
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const Text(
                'Các phương pháp\nphòng tránh bệnh đột quỵ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 86, 146),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: 20,
                    bottom: 20,
                    right: 20,
                    top: 0), //apply padding to some sides only
                child: Text(
                  '1.Chế độ ăn uống hợp lý: Đa dạng hóa chế độ ăn uống, tăng cường tiêu thụ chất xơ, hạn chế ăn mặn, giảm tiêu thụ đường\n2.Tập thể dục đều đặn.\n3.Không hút thuốc lá.\n4.Hạn chế rượu bia.\n5.Kiểm tra sức khỏe định kỳ.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Image.asset('assets/huyet_ap_chuan.png'),
            ],
          ),
        ),
      ),
    );
  }
}

final AuthService _auth = AuthService();
