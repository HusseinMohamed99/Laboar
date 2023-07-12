// class RegisterCubit extends Cubit<RegisterStates> {
//   RegisterCubit() : super(RegisterInitialState());
//
//   static RegisterCubit get(context) => BlocProvider.of(context);
//
//   void userRegister({
//     required String password,
//     required String fullName,
//     required String phone,
//   }) async {
//     emit(RegisterLoadingState());
//     FirebaseAuth.instance
//         .verifyPhoneNumber(
//       phoneNumber: '+44 7123 123 456',
//       verificationCompleted: (PhoneAuthCredential credential) {},
//       verificationFailed: (FirebaseAuthException e) {},
//       codeSent: (String verificationId, int? resendToken) {},
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     )
//         .then((value) {
//       userCreate(phone: phone, fullName: fullName, uId: value.user!.uid);
//     }).catchError((error) {
//       emit(RegisterErrorState(error.toString()));
//     });
//   }
//
//   void userCreate({
//     required String fullName,
//     required String uId,
//     required String phone,
//   }) async {
//     UserModel model = UserModel(
//       fullName: fullName,
//       uId: uId,
//       image:
//           'https://cdn-icons-png.flaticon.com/512/214/214070.png?w=740&t=st=1676604521~exp=1676605121~hmac=cbd7577a96e66bf8093132e5b5da0c2a649f4f7c7cdfb6019708db0b417ddc8c',
//       phone: phone,
//     );
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(uId)
//         .set(model.toFireStore())
//         .then((value) {
//       emit(UserCreateSuccessState(uId));
//     }).catchError((error) {
//       emit(UserCreateErrorState(error.toString()));
//     });
//   }
//
//   IconData suffix = Icons.visibility_outlined;
//   bool isPassword = true;
//
//   void showPassword() {
//     isPassword = !isPassword;
//     suffix =
//         isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
//
//     emit(ChangePasswordRegisterState());
//   }
// }
