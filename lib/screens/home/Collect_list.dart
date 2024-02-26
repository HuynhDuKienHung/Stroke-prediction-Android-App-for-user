import 'package:app_benh_nhan/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectList extends StatefulWidget {
  const CollectList({super.key});

  @override
  State<CollectList> createState() => _CollectListState();
}

class _CollectListState extends State<CollectList> {
  @override
  Widget build(BuildContext context) {
    final Collect = Provider.of<List<UserModel>?>(context) ?? [];
    for (var user in Collect) {
      print(user.full_name);
      print(user.age);
      print(user.gender);
      print(user.hypertension);
      print(user.heart_disease);
      print(user.work_type);
      print(user.avg_glucose_level);
      print(user.bmi);
      print(user.smoking_status);
    }
    return ListView.builder(
      itemCount: Collect.length,
      itemBuilder: (context, index) {
        return null;
      
//        return CollectTitle(Collect: Collect?[index]);
      },
    );
  }
}
