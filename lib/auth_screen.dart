import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24.0, 96.0, 24.0, 24.0),
        children: [
          Column(
            children: [
              const Text(
                'Supabase Auth UI',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SupaEmailAuth(
                redirectTo:
                    kIsWeb ? null : "myapptest://com.example.auth_ui_example",
                // localization: const SupaEmailAuthLocalization(
                //   enterEmail: "Ingiza barua pepe yako",
                //   validEmailError: "'الرجاء إدخال عنوان بريد إلكتروني صالح",
                //   enterPassword: "Ingresa tu contraseña",
                //   passwordLengthError:
                //       'Tafadhali ingiza nenosiri lenye herufi angalau 6',
                //   signIn: 'تسجيل الدخول',
                //   signUp: 'Registrarse',
                //   forgotPassword: 'Umesahau nenosiri lako?',
                //   dontHaveAccount: 'لا تملك حساب؟ سجل',
                //   haveAccount: '¿Ya tienes una cuenta? Inicia sesión',
                //   sendPasswordReset: 'Tuma barua pepe ya kurekebisha nenosiri',
                //   backToSignIn: 'العودة إلى تسجيل الدخول',
                //   unexpectedError: 'Se produjo un error inesperado',
                // ),
                onSignInComplete: (res) =>
                    Navigator.pushNamed(context, '/home'),
                onSignUpComplete: (res) =>
                    Navigator.pushNamed(context, '/home'),
                onError: (error) => SnackBar(content: Text(error.toString())),
              ),
              const SizedBox(height: 24.0),
              SupaSocialsAuth(
                socialProviders: const [
                  OAuthProvider.google,
                  OAuthProvider.github,
                ],
                onSuccess: (session) {
                  Navigator.pushNamed(context, '/home');
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
