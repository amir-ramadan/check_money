import 'package:application/models/user_model.dart';
import 'package:application/screens/HomeScreen.dart';
import 'package:application/screens/privacy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'loading_to_home.dart';
import 'login_page.dart';

var firstNameController = TextEditingController();
var lastNameController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var passwordController1 = TextEditingController();
var dateController = TextEditingController();

UserModel? userModel ;

FirebaseAuth auth = FirebaseAuth.instance;

FirebaseFirestore fireStore = FirebaseFirestore.instance;

void createUserAccount(
    {
      context ,
      required String email,
      required String password,
      required String date,
      required String name}) async {

  await auth
      .createUserWithEmailAndPassword(email: email, password: password)
      .then((value) {
    saveUserData( date: date,
        name: name, email: email, uid: value.user!.uid).then((value){
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => LoadingHomeScreen()), (route) => false);
          
    });

  }).catchError((onError) {
  });
}

Future<void> saveUserData({

  required String name,
  required String email,
  required String uid,
  required String date,

})async {
   userModel = UserModel(
     date: date,
      name: name,
      email: email,

      uid: uid);

  fireStore.collection('users').doc(uid).set(userModel!.toMap());
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = false;
  bool _isButtonEnabled = false;
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  late String _fname;
  late String _lname;
  late String _Rpassword;
  late String _date;

  var passVisabil = true;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      String fullName = '${firstNameController.text} ${lastNameController.text}';


      createUserAccount( context: context , date: dateController.text , email: emailController.text, password: passwordController.text, name: fullName);

      // Perform email and password validation logic here
      if (_email != null &&
          _password != null &&
          _fname != null &&
          _lname != null &&
          _Rpassword == _password &&
          _date != null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('succeeded'),
              content: const Text('your sign up has succeesfully'),
              actions: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black54),
                  ),
                  child: const Text(
                    'OK',
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Invalid Credentials'),
              content: Text('Please enter valid email and password.'),
              actions: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black54),
                  ),
                  child: Text(
                    'OK',
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              'Create your account',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: firstNameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white30,
                          labelText: 'First Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          prefixIcon: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.blue,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 5) {
                            return 'First Name is required.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _fname = value!;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 15.5,
                      ),
                      TextFormField(
                        controller: lastNameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white30,
                          labelText: 'Last Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          prefixIcon: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.blue,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 5) {
                            return 'Last Name is required.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _lname = value!;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 15.5,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white30,
                          labelText: 'E-mail',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.blue,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 10) {
                            return 'Email is required.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 15.5,
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white30,
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passVisabil = !passVisabil;
                              });
                            },
                            icon: Icon(passVisabil
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: Colors.blue,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 8) {
                            return 'password is required.';
                          }

                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                        keyboardType: TextInputType.phone,
                        obscureText: passVisabil,
                      ),
                      const SizedBox(
                        height: 15.5,
                      ),
                      TextFormField(
                        controller: passwordController1,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white30,
                          labelText: 'Repeat Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passVisabil = !passVisabil;
                              });
                            },
                            icon: Icon(passVisabil
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: Colors.blue,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 8) {
                            return 'Repeat Password is required.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _Rpassword = value!;
                        },
                        keyboardType: TextInputType.phone,
                        obscureText: passVisabil,
                      ),
                      const SizedBox(
                        height: 15.5,
                      ),
                      TextFormField(
                        controller: dateController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white30,
                          labelText: ' Enter Date',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: Colors.blue,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Date is required.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _date = value!;
                        },
                        keyboardType: TextInputType.datetime,
                      ),
                      const SizedBox(
                        height: 15.5,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: _isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isChecked = value!;
                                      _isButtonEnabled = value;
                                    });
                                  },
                                ),
                                Text('I agree to the terms and conditions')
                              ],
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                onPressed:
                                    _isButtonEnabled ? _submitForm : null,
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.5,
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => LoginForm()));
                          },
                          child: const Text(
                            'Already a member? Login',
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const PrivacyInfo()));
                            },
                            child: const Text(
                              'Privacy Policy',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => LoginForm()));
                            },
                            child: const Text(
                              'Terms of Service',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
