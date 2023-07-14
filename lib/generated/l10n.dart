// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Laboar`
  String get appTitle {
    return Intl.message(
      'Laboar',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Find Your\nHome Service`
  String get title {
    return Intl.message(
      'Find Your\nHome Service',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Easy Process`
  String get title1 {
    return Intl.message(
      'Easy Process',
      name: 'title1',
      desc: '',
      args: [],
    );
  }

  /// `Expert People`
  String get title2 {
    return Intl.message(
      'Expert People',
      name: 'title2',
      desc: '',
      args: [],
    );
  }

  /// `All In One Place`
  String get title3 {
    return Intl.message(
      'All In One Place',
      name: 'title3',
      desc: '',
      args: [],
    );
  }

  /// `Find all your house needs in one place.  We provide every service to make your home experience smooth.`
  String get body1 {
    return Intl.message(
      'Find all your house needs in one place.  We provide every service to make your home experience smooth.',
      name: 'body1',
      desc: '',
      args: [],
    );
  }

  /// `We have the best in class individuals working just for you. They are well  trained and capable of handling anything you need.`
  String get body2 {
    return Intl.message(
      'We have the best in class individuals working just for you. They are well  trained and capable of handling anything you need.',
      name: 'body2',
      desc: '',
      args: [],
    );
  }

  /// `We have all the household services \nyou need on a daily basis with\n easy access`
  String get body3 {
    return Intl.message(
      'We have all the household services \nyou need on a daily basis with\n easy access',
      name: 'body3',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Term and Conditions`
  String get termAndConditions {
    return Intl.message(
      'Term and Conditions',
      name: 'termAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to our`
  String get loginHere {
    return Intl.message(
      'By creating an account, you agree to our',
      name: 'loginHere',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get enter {
    return Intl.message(
      'Enter',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter your Phone and password\nto continue`
  String get authLogin {
    return Intl.message(
      'Please Enter your Phone and password\nto continue',
      name: 'authLogin',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phoneNumber {
    return Intl.message(
      'Phone',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Phone`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter Your Phone',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get enterPassword {
    return Intl.message(
      'Enter Your Password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password ?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password ?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Phone Number\nto reset password.`
  String get hintForgetPassword {
    return Intl.message(
      'Enter your Phone Number\nto reset password.',
      name: 'hintForgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message(
      'Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get google {
    return Intl.message(
      'Google',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `Don’t Have Account ?`
  String get noAccount {
    return Intl.message(
      'Don’t Have Account ?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Full Name`
  String get enterFullName {
    return Intl.message(
      'Enter Your Full Name',
      name: 'enterFullName',
      desc: '',
      args: [],
    );
  }

  /// `Have Account ?`
  String get haveAccount {
    return Intl.message(
      'Have Account ?',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `OTP`
  String get otp {
    return Intl.message(
      'OTP',
      name: 'otp',
      desc: '',
      args: [],
    );
  }

  /// `An Authentication code has been sent to`
  String get hintOtp {
    return Intl.message(
      'An Authentication code has been sent to',
      name: 'hintOtp',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Code Sent. Resend Code in`
  String get hintSend {
    return Intl.message(
      'Code Sent. Resend Code in',
      name: 'hintSend',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create strong and secured\nnew password.`
  String get hintPassword {
    return Intl.message(
      'Create strong and secured\nnew password.',
      name: 'hintPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Confirm Password`
  String get enterConfirmPassword {
    return Intl.message(
      'Enter Your Confirm Password',
      name: 'enterConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Save Password`
  String get savePassword {
    return Intl.message(
      'Save Password',
      name: 'savePassword',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
