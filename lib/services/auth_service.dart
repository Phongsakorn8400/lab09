import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  static GoogleSignIn googleSignin = GoogleSignIn();
  // -------------------------------------------------------Sign In-------------------------------------------------------
  Future<void> signinbygoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignin.signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    print(googleUser?.displayName);

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.email);
  }

  // -------------------------------------------------------Sign Out-------------------------------------------------------
  Future<void> signoutbygoogle() async {
    await FirebaseAuth.instance.signOut().then((value){
      googleSignin.signOut();
    }); 
  }

}