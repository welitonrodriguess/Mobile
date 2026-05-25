import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sua função de Login
  Future<User?> fazerLogin(String email, String password) async {
    try {
      if (email.trim().isEmpty || password.trim().isEmpty) {
        throw Exception("E-mail e senha são obrigatórios.");
      }

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(_tratarErroFirebase(e.code));
    } catch (e) {
      throw Exception("Erro interno. Tente novamente.");
    }
  }

  String _tratarErroFirebase(String errorCode) {
    switch (errorCode) {
      case 'invalid-email': return 'Formato de e-mail inválido.';
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential': return 'E-mail ou senha incorretos.';
      case 'too-many-requests': return 'Muitas tentativas. Bloqueado temporariamente.';
      default: return 'Erro de autenticação: $errorCode';
    }
  }
}