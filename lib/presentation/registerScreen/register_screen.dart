// class RegisterScreen extends StatelessWidget {
//   const RegisterScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var formKey = GlobalKey<FormState>();
//     var fullNameController = TextEditingController();
//     var passwordController = TextEditingController();
//     var phoneController = TextEditingController();
//     return BlocProvider(
//       create: (BuildContext context) => SignUpCubit(),
//       child:
//           BlocConsumer<SignUpCubit, SignUpStates>(listener: (context, state) {
//         if (state is SignUpSuccessState) {
//           MyDialog.showLoadingDialog(context, 'SignUp is successfully');
//         }
//         if (state is UserCreateSuccessState) {
//           showToast(text: 'Sign Up Successfully', state: ToastStates.success);
//           MyDialog.showLoadingDialog(context, 'SignUp is successfully');
//           CacheHelper.saveData(value: state.uid, key: 'uId').then((value) {
//             uId = state.uid;
//             TripsoCubit.get(context).getUserData();
//             navigateAndFinish(context, routeName: CitiesScreen.routeName);
//           });
//         } else if (state is SignUpErrorState) {
//           MyDialog.showLoadingDialog(context, 'SignUp is Error');
//           MyDialog.hideDialog(context);
//           MyDialog.showMessage(
//             context,
//             state.error,
//             negActionTitle: 'Cancel',
//             negAction: () {
//               Navigator.pop(context);
//             },
//           );
//         }
//       }, builder: (context, state) {
//         return Container(
//           alignment: Alignment.center,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(AssetPath.signUPImage),
//               fit: BoxFit.fill,
//             ),
//           ),
//           child: FadeAnimation(
//             1.0,
//             child: Scaffold(
//               backgroundColor: Colors.transparent,
//               appBar: secondaryAppBar(),
//               body: CustomScrollableForm(
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
//                         child: Row(
//                           children: [
//                             IconButton(
//                               onPressed: () {
//                                 pop(context);
//                               },
//                               icon: Icon(
//                                 Icons.arrow_back,
//                                 size: 25.sp,
//                                 color: ThemeApp.secondaryColor,
//                               ),
//                             ),
//                             Space(width: 20.w, height: 0.h),
//                             Text(
//                               'Create Account',
//                               style: TextStyle(
//                                   fontSize: 30.sp,
//                                   color: ThemeApp.secondaryColor,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Space(width: 0.w, height: 20.h),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 20).r,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'First Name',
//                                   style: TextStyle(
//                                     color: ThemeApp.secondaryColor,
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 Space(width: 0.w, height: 8.h),
//                                 DefaultTextFormField(
//                                   color:
//                                       ThemeApp.secondaryColor.withOpacity(0.3),
//                                   context: context,
//                                   controller: fullNameController,
//                                   keyboardType: TextInputType.name,
//                                   validate: (String? value) {
//                                     if (value!.trim().isEmpty ||
//                                         value.length < 3) {
//                                       return 'First Name is Required';
//                                     }
//                                     return null;
//                                   },
//                                   prefix: Icons.edit_outlined,
//                                   hint: 'First Name',
//                                 ),
//                                 Space(width: 0.w, height: 20.h),
//                                 Text(
//                                   'Last Name',
//                                   style: TextStyle(
//                                     color: ThemeApp.secondaryColor,
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 Space(width: 0.w, height: 8.h),
//                                 DefaultTextFormField(
//                                   color:
//                                       ThemeApp.secondaryColor.withOpacity(0.3),
//                                   context: context,
//                                   controller: lastnameController,
//                                   keyboardType: TextInputType.name,
//                                   validate: (String? value) {
//                                     if (value!.trim().isEmpty ||
//                                         value.length < 3) {
//                                       return 'Last Name is Required';
//                                     }
//                                     return null;
//                                   },
//                                   prefix: Icons.edit_outlined,
//                                   hint: 'Last Name',
//                                 ),
//                                 Space(width: 0.w, height: 20.h),
//                                 Text(
//                                   'Email Address',
//                                   style: TextStyle(
//                                     color: ThemeApp.secondaryColor,
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 Space(width: 0.w, height: 8.h),
//                                 DefaultTextFormField(
//                                   color:
//                                       ThemeApp.secondaryColor.withOpacity(0.3),
//                                   context: context,
//                                   controller: emailController,
//                                   keyboardType: TextInputType.emailAddress,
//                                   validate: (String? value) {
//                                     if (value!.trim().isEmpty ||
//                                         value.length < 16) {
//                                       return 'Sorry, your mail must be\n between 16 and 30 characters long.';
//                                     }
//                                     return null;
//                                   },
//                                   prefix: Icons.alternate_email,
//                                   hint: 'Email Address',
//                                 ),
//                                 Space(width: 0.w, height: 20.h),
//                                 Text(
//                                   'Mobile Number',
//                                   style: TextStyle(
//                                     color: ThemeApp.secondaryColor,
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 Space(width: 0.w, height: 8.h),
//                                 DefaultTextFormField(
//                                   color:
//                                       ThemeApp.secondaryColor.withOpacity(0.3),
//                                   context: context,
//                                   controller: phoneController,
//                                   keyboardType: TextInputType.phone,
//                                   validate: (String? value) {
//                                     if (value!.trim().isEmpty ||
//                                         value.length < 11 ||
//                                         value.length > 11) {
//                                       return 'An Egyptian phone number consisting of 11 digits';
//                                     }
//                                     return null;
//                                   },
//                                   prefix: Icons.phone_android,
//                                   hint: 'Mobile Number',
//                                 ),
//                                 Space(width: 0.w, height: 20.h),
//                                 Text(
//                                   'Password',
//                                   style: TextStyle(
//                                     color: ThemeApp.secondaryColor,
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 Space(width: 0.w, height: 8.h),
//                                 DefaultTextFormField(
//                                   color:
//                                       ThemeApp.secondaryColor.withOpacity(0.3),
//                                   context: context,
//                                   obscuringCharacter: '*',
//                                   controller: passwordController,
//                                   keyboardType: TextInputType.visiblePassword,
//                                   validate: (String? value) {
//                                     RegExp regex = RegExp(
//                                         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#+/%^=_$&*~]).{8,}$');
//                                     if (value!.trim().isEmpty ||
//                                         value.trim().length < 8 ||
//                                         !regex.hasMatch(value)) {
//                                       return 'Uppercase and lowercase letters,\nnumbers and signs, and not less than 8 letters';
//                                     }
//                                     return null;
//                                   },
//                                   prefix: Icons.lock_outline_sharp,
//                                   suffix: SignUpCubit.get(context).suffix,
//                                   isPassword:
//                                       SignUpCubit.get(context).isPassword,
//                                   suffixPressed: () {
//                                     SignUpCubit.get(context).showPassword();
//                                   },
//                                   hint: 'Password',
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Space(width: 0.w, height: 30.h),
//                           defaultMaterialButton(
//                             function: () {
//                               if (formKey.currentState!.validate()) {
//                                 SignUpCubit.get(context).userSignUp(
//                                   phone: phoneController.text,
//                                   password: passwordController.text,
//                                   fullName: fullNameController.text,
//                                 );
//                               }
//                             },
//                             text: 'Sign up',
//                             color: ThemeApp.primaryColor,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }
