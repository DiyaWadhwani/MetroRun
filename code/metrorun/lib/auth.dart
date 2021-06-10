import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:metrorun/constants.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

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
  myUid = user!.uid;
  myName = user.displayName!;
  myPhotoUrl = user.photoURL!;
  myEmail = user.email!;
  print("User signed in : " + myName);
  print("User UID : " + myUid);

  assert(!user.isAnonymous);
  // assert(await user.getIdToken() != null);

  final User? currentUser = _auth.currentUser;
  print("Current User UID : " + currentUser!.uid);
  assert(currentUser.uid == user.uid);
  if (currentUser.uid == user.uid) {
    print("UID matches");
  }
  return user;
}

Future<void> signOutWithGoogle() async {
  await _auth.signOut();
  googleSignIn.disconnect();
}
