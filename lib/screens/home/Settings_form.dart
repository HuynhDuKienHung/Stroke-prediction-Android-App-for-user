import 'package:app_benh_nhan/models/myuser.dart';
import 'package:app_benh_nhan/services/database.dart';
import 'package:app_benh_nhan/shared/constants.dart';
import 'package:app_benh_nhan/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
//  final List<String> name1 = ['0', '1', '2', '3', '4'];
  String? current_full_name;
  String? current_age;
  String? current_gender;
  String? current_hypertension;
  String? current_heart_disease;
  String? current_marrtial_status;
  String? current_work_type;
  String? current_residence;
  String? current_avg_glucose_level;
  String? current_bmi;
  String? current_smoking_status;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<GetUser?>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user?.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;
            return Scaffold(
              resizeToAvoidBottomInset: true,
              body: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    
                    reverse: true,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Cập nhật thông tin',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                            initialValue: userData?.full_name,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Họ và Tên', labelText: 'Họ và Tên'),
                            validator: (val) => val!.isEmpty
                                ? 'Không để trống thông tin'
                                : null,
                            onChanged: (val) {
                              setState(() => current_full_name = val);
                            }),
                        const SizedBox(height: 10.0),
                        TextFormField(
                            initialValue: userData?.age,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'vd: 22', labelText: 'Tuổi'),
                            validator: (val) => val!.isEmpty
                                ? 'Không để trống thông tin'
                                : null,
                            onChanged: (val) {
                              setState(() => current_age = val);
                            }),
                        const SizedBox(height: 10.0),
                        TextFormField(
                            initialValue: userData?.gender,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Nam, Nữ', labelText: 'Giới tính'),
                            validator: (val) => val!.isEmpty
                                ? 'Không để trống thông tin'
                                : null,
                            onChanged: (val) {
                              setState(() => current_gender = val);
                            }),
                        const SizedBox(height: 10.0),
                        TextFormField(
                            initialValue: userData?.hypertension,
                            decoration: textInputDecoration.copyWith(
                                hintText:
                                    'Có bị cao huyết áp hay không ? Nhập "có" hoặc "không" ',
                                labelText: 'Cao Huyết áp'),
                            validator: (val) => val!.isEmpty
                                ? 'Không để trống thông tin'
                                : null,
                            onChanged: (val) {
                              setState(() => current_hypertension = val);
                            }),
                        const SizedBox(height: 10.0),
                        TextFormField(
                            initialValue: userData?.heart_disease,
                            decoration: textInputDecoration.copyWith(
                                hintText:
                                    'Đã từng bị bệnh tim hay chưa? Nhập "có" hoặc "không"',
                                labelText: 'Bệnh tim'),
                            validator: (val) => val!.isEmpty
                                ? 'Không để trống thông tin'
                                : null,
                            onChanged: (val) {
                              setState(() => current_heart_disease = val);
                            }),
                        const SizedBox(height: 10.0),
                        TextFormField(
                            initialValue: userData?.marrital_status,
                            decoration: textInputDecoration.copyWith(
                                hintText:
                                    'Đã kết hôn hay chưa? Nhập "có" hoặc "không"',
                                labelText: 'Tình trạng hôn nhân'),
                            validator: (val) => val!.isEmpty
                                ? 'Không để trống thông tin'
                                : null,
                            onChanged: (val) {
                              setState(() => current_marrtial_status = val);
                            }),
                        const SizedBox(height: 10.0),
                        TextFormField(
                            initialValue: userData?.work_type,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Nghề nghiệp hiện tại',
                                labelText: 'Nghề nghiệp'),
                            validator: (val) => val!.isEmpty
                                ? 'Không để trống thông tin'
                                : null,
                            onChanged: (val) {
                              setState(() => current_work_type = val);
                            }),
                        const SizedBox(height: 10.0),
                        TextFormField(
                            initialValue: userData?.residence,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Địa chỉ', labelText: 'Địa chỉ'),
                            validator: (val) => val!.isEmpty
                                ? 'Không để trống thông tin'
                                : null,
                            onChanged: (val) {
                              setState(() => current_residence = val);
                            }),
                        const SizedBox(height: 10.0),
                        TextFormField(
                            initialValue: userData?.avg_glucose_level,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Chỉ số đường huyết trung bình',
                                labelText: 'Chỉ số đường huyết trung bình'),
                            validator: (val) => val!.isEmpty
                                ? 'Không để trống thông tin'
                                : null,
                            onChanged: (val) {
                              setState(() => current_avg_glucose_level = val);
                            }),
                        const SizedBox(height: 10.0),
                        TextFormField(
                            initialValue: userData?.bmi,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Chỉ số BMI', labelText: 'BMI'),
                            validator: (val) => val!.isEmpty
                                ? 'Không để trống thông tin'
                                : null,
                            onChanged: (val) {
                              setState(() => current_bmi = val);
                            }),
                        const SizedBox(height: 10.0),
                        TextFormField(
                            initialValue: userData?.smoking_status,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Chưa từng, đã từng, không',
                                labelText: 'Tình trạng hút thuốc'),
                            validator: (val) => val!.isEmpty
                                ? 'Không để trống thông tin'
                                : null,
                            onChanged: (val) {
                              setState(() => current_smoking_status = val);
                            }),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await DatabaseService(uid: user?.uid)
                                    .updateUserData(
                                        current_full_name ??
                                            userData!.full_name!,
                                        current_age ?? userData!.age!,
                                        current_gender ?? userData!.gender!,
                                        current_hypertension ??
                                            userData!.hypertension!,
                                        current_heart_disease ??
                                            userData!.heart_disease!,
                                        current_marrtial_status ??
                                            userData!.marrital_status!,
                                        current_work_type ??
                                            userData!.work_type!,
                                        current_residence ??
                                            userData!.residence!,
                                        current_avg_glucose_level ??
                                            userData!.avg_glucose_level!,
                                        current_bmi ?? userData!.bmi!,
                                        current_smoking_status ??
                                            userData!.smoking_status!);

                                Navigator.pop(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            child: const Text(
                              'Cập nhật',
                              style: TextStyle(color: Colors.white),
                            )),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  )),
            );
          } else {
            return const Loading();
          }
        });
  }
}
