import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(LoginState());

  // toggle the checkbox state
  void toggleCheckbox(bool newValue) {
    state = state.copyWith(checkboxValue: newValue);
    _saveToLocalStorage(); // Save the checkbox state to local storage
  }

  // to toggle the obscure state
  void toggleObscure(bool newValue) {
    state = state.copyWith(obscureText: newValue);
    _saveToLocalStorage(); // Save the obscure state to local storage
  }

  void toggleSignIn(bool isSign) {
    state = state.copyWith(isSignIn: isSign);
  }

  // save email and password
  void emailAndPassword(String email, String password) {
    state = state.copyWith(email: email, password: password);
    _saveToLocalStorage(); // Save the obscure state to local storage
  }

  // Load checkbox, obscure,email and password state from local storage
  Future<void> loadFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final checkboxValue = prefs.getBool('checkboxValue') ?? false;
    final obscureText = prefs.getBool('obscureText') ?? true;
    final email = prefs.getString('email') ?? '';
    final password = prefs.getString('password') ?? '';
    final isSignIn = prefs.getBool('isSignIn') ?? false;
    state = state.copyWith(
        checkboxValue: checkboxValue,
        obscureText: obscureText,
        email: email,
        password: password,
        isSignIn: isSignIn);
  }

  // Save checkbox and obscure state to local storage
  Future<void> _saveToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('checkboxValue', state.checkboxValue);
    prefs.setBool('obscureText', state.obscureText);
    prefs.setString('email', state.email ?? '');
    prefs.setString('password', state.password ?? '');
    prefs.setBool('isSignIn', state.isSignIn);
  }
}

final loginStateNotifierProvider =
    StateNotifierProvider<LoginStateNotifier, LoginState>((ref) {
  final notifier = LoginStateNotifier();
  // Load the state from SharedPreferences when the provider is first created
  notifier.loadFromLocalStorage();
  return notifier;
});

class LoginState {
  final bool checkboxValue;
  final bool obscureText;
  final String? email;
  final String? password;
  final bool isSignIn;

  LoginState(
      {this.checkboxValue = false,
      this.obscureText = true,
      this.email,
      this.password,
      this.isSignIn = false});

  LoginState copyWith(
      {bool? checkboxValue,
      bool? obscureText,
      String? email,
      String? password,
      bool? isSignIn}) {
    return LoginState(
        checkboxValue: checkboxValue ?? this.checkboxValue,
        obscureText: obscureText ?? this.obscureText,
        email: email,
        password: password,
        isSignIn: isSignIn ?? this.isSignIn);
  }
}
