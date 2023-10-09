import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //google sign in
  Future<UserCredential> signInWithGoogle() async {
    //begin with interactive sign in process
    final GoogleSignInAccount? guser = await GoogleSignIn().signIn();

    //obtain the auth details from the request
    final GoogleSignInAuthentication gauth = await guser!.authentication;

    //create a new credential for the user
    final credential = await GoogleAuthProvider.credential(
        accessToken: gauth.accessToken, idToken: gauth.idToken);

    //lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
