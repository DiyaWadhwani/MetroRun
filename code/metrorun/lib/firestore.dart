import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';

final FirebaseFirestore db = FirebaseFirestore.instance;

final CollectionReference users = db.collection('Users');
final CollectionReference rides = users.doc(myUid).collection('Ride Data');
// .orderBy('Timestamp') as CollectionReference<Object?>;

Future<void> userExists() async {
  print("------entering userExists()------");
  users.doc(myUid).get().then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      print("Document exists in db");
    } else {
      print("New user signed in, creating new document");
      userSetup();
    }
  });
  print("------exiting userExists()------");
}

Future<void> userSetup() async {
  print("------entering userSetup()------");
  users
      .doc(myUid)
      .set({
        'UID': myUid,
        'Name': myName,
        'Email ID': myEmail,
        'PhotoURL': myPhotoUrl
      })
      .then((value) => print("New document added to collection - $myUid"))
      .catchError((error) => print("Failed to add user - $error"));
  print("------exiting userSetup()------");
}

Map<String, dynamic> rideFields = {};

Future<void> updateRideData() async {
  DocumentReference documentReferencer = rides.doc(myQrString);

  Map<String, dynamic> data = <String, dynamic>{
    'To': myDestination,
    'From': mySource,
    'QR GenString': myQrString,
    'Amount': myAmount,
    'UID': myUid,
    'Timestamp': Timestamp.now(),
    'Payment ID': myPaymentId,
  };

  await documentReferencer
      .set(data)
      .whenComplete(() => print("Rides updated on the database!"))
      .catchError((e) => print(e));

  fetchRides();
}

int numTickets = 0;
List rideList = [];

Map<String, dynamic> fetchRides() {
  rides.get().then((querySnapshot) {
    // print(querySnapshot);
    querySnapshot.docs.forEach((result) {
      rides.get().then((querySnapshot) {
        print(querySnapshot.size);
        numTickets = querySnapshot.size;
        querySnapshot.docs.forEach((result) {
          print(result.data());
          rideFields = result.data() as Map<String, dynamic>;
          //print("Ride data-------" + rideFields.toString());
          ;
          rideList.add(rideFields);
          print("Final ===> $rideList");
        });
      });
    });
  });
  return rideFields;
}

// Future<void> updateRideData() async {
//   print("------entering updateRideData()------");
//   users.doc(myUid).get().then((DocumentSnapshot documentSnapshot) {
//     rides
//         .doc(myQrString)
//         .set({
//           'To': myDestination,
//           'From': mySource,
//           'QR GenString': myQrString,
//           'Amount': myAmount,
//           'UID': myUid,
//           'Timestamp': Timestamp.now(),
//           'Payment ID': myPaymentId,
//         })
//         .then((value) => print("New ticket saved - $myUid"))
//         .catchError((error) => print("Failed to save ticket - $error"));
//   });
//   print("------exiting updateRideData()------");
// }
