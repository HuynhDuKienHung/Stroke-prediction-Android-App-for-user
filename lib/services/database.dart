import 'package:app_benh_nhan/models/myuser.dart';
import 'package:app_benh_nhan/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //collection reference
  final String? uid;
  DatabaseService({this.uid});
  final CollectionReference MyCollection =
      FirebaseFirestore.instance.collection('User');

  Future updateUserData(
    dynamic fullName,
    dynamic age,
    dynamic gender,
    dynamic hypertension,
    dynamic heartDisease,
    dynamic marritalStatus,
    dynamic workType,
    dynamic residence,
    dynamic avgGlucoseLevel,
    dynamic bmi,
    dynamic smokingStatus,
  ) async {
    return await MyCollection.doc(uid).set({
      'full_name': fullName,
      'age': age,
      'gender': gender,
      'hypertension': hypertension,
      'heart_disease': heartDisease,
      'marrital_status': marritalStatus,
      'work_type': workType,
      'residence': residence,
      'avg_glucose_level': avgGlucoseLevel,
      'bmi': bmi,
      'smoking_status': smokingStatus
    });
  }

// user_model from snashot
  List<UserModel> _UserModelFomSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UserModel(
          full_name: doc.get('full_name') ?? '',
          age: doc.get('age') ?? '',
          gender: doc.get('gender') ?? '',
          hypertension: doc.get('hypertension') ?? '',
          heart_disease: doc.get('heart_disease') ?? '',
          marrital_status: doc.get('marrital_status') ?? '',
          work_type: doc.get('work_type') ?? '',
          residence: doc.get('residence') ?? '',
          avg_glucose_level: doc.get('avg_glucose_level') ?? '',
          bmi: doc.get('bmi') ?? '',
          smoking_status: doc.get('smoking_status') ?? '');
    }).toList();
  }

// UserData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      full_name: snapshot.get('full_name'),
      age: snapshot.get('age'),
      gender: snapshot.get('gender'),
      hypertension: snapshot.get('hypertension'),
      heart_disease: snapshot.get('heart_disease'),
      marrital_status: snapshot.get('marrital_status'),
      work_type: snapshot.get('work_type'),
      residence: snapshot.get('residence'),
      avg_glucose_level: snapshot.get('avg_glucose_level'),
      bmi: snapshot.get('bmi'),
      smoking_status: snapshot.get('smoking_status'),
    );
  }

  Stream<List<UserModel>> get Collection {
    return MyCollection.snapshots().map(_UserModelFomSnapshot);
  }

  Stream<UserData> get userData {
    return MyCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
