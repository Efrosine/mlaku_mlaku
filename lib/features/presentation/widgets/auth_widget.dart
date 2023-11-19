import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlaku_mlaku/features/presentation/bloc/auth/auth_bloc_bloc.dart';

import '../../domain/entities/user_ent.dart';
import 'globalcomponent/comp_text_field.dart';

class AuthWidget extends StatelessWidget {
  final bool isLogin;
  const AuthWidget({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Container(
      margin: EdgeInsets.fromLTRB(24, 305, 24, 85),
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Text(
                isLogin ? 'Login' : 'Register',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32),
              CTextFieldAuth(
                controller: emailController,
                label: 'Email',
                isPassword: false,
              ),
              SizedBox(height: 32),
              CTextFieldAuth(
                controller: passwordController,
                label: 'Passworddddd',
                isPassword: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password ?'),
                ),
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<AuthBlocBloc>(context).add(AuthBlocEventChangeAuth());
                },
                child: Text(
                    isLogin ? 'Belum punya akun ? Daftar' : 'Sudah punya akun ? Login'),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                if (isLogin) {
                  BlocProvider.of<AuthBlocBloc>(context).add(AuthBlocEventLogIn(
                    UserEntity(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  ));
                } else {
                  BlocProvider.of<AuthBlocBloc>(context).add(AuthBlocEventSignUp(
                    UserEntity(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  ));
                }
              },
              child: Text(isLogin ? 'Login' : 'Register'),
            ),
          ),
        ],
      ),
    );
  }
}
