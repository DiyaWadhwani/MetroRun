import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:metrorun/constants.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;
final CollectionReference users =
    FirebaseFirestore.instance.collection('Users');

Future<User> signInWithGoogle() async {
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

  final OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);

  final UserCredential userCredential =
      await _auth.signInWithCredential(credential);

  final User? user = userCredential.user;
  String? name = user!.displayName;
  print("User signed in : $name");
  print("User UID : $user.uid");

  assert(!user.isAnonymous);
  // assert(await user.getIdToken() != null);

  final User? currentUser = _auth.currentUser;
  print("Current User UID : $currentUser.uid");
  assert(currentUser!.uid == user.uid);
  if (currentUser!.uid == user.uid) {
    myUid = user.uid;
    myName = user.displayName!;
    myPhotoUrl = user.photoURL!;
    myEmail = user.email!;
    print("UID matches");
    userExists();
  }
  return user;
}

Future<void> signOutWithGoogle() async {
  await _auth.signOut();
  googleSignIn.disconnect();
}

Future<void> userExists() async {
  users.doc(myUid).get().then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      print("Document exists in db");
    } else {
      print("New user signed in");
      userSetup();
    }
  });
}

Future<void> userSetup() async {
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
}
