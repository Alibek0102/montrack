import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier {
  bool isLoggedIn = false;

  bool hasAvailableToken () {
    return FirebaseAuth.instance.currentUser != null;
  }

  bool _isValidEmail(String email) {
    return email.contains(RegExp(r'^[^@]+@[^@]+\.[^@]+$'));
  }

  bool _isValidPassword(String password) {
    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[!@#\$%^&*(),.?":{}|<>]).*$');
    return passwordRegex.hasMatch(password);
  }

  Future<void> login({required String? email, required String? password}) async {
    if(email == null || password == null) throw ErrorDescription('Неправильный пароль или email');
    if(email.isEmpty || password.isEmpty) throw ErrorDescription('Введите логин и пароль');
    if(_isValidEmail(email) == false) throw ErrorDescription('Ошибка: Некорректный email');
    if(password.length < 8) throw ErrorDescription('Пароль должен содержать минимум 8 символов');
    if(_isValidPassword(password) == false) throw ErrorDescription('Пароль должен содержать хотя бы одну заглавную букву и один спецсимвол');

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(exception) {
      if(exception.code == 'user-not-found') {
        throw ErrorDescription('Не удалось найти пользователя');
      } else {
        throw ErrorDescription('Не удалось войти в аккаунт');
      }
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}