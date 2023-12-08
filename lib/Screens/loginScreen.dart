// ignore_for_file: file_names, prefer_const_constructors, unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/imageFetcher.dart';
import '../providers/providers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _isLoading = false;
  TextEditingController _useridController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void submithandler(WidgetRef ref) async {
    try {
      FocusScope.of(context).unfocus();
      setState(() {
        _isLoading = true;
      });

      Map<String, String> mp = {
        'userid': _useridController.text.toString(),
        'password': _passwordController.text.toString()
      };

      final status = ref.watch(loginProvider(mp));

      status.when(
        data: (value) async {
          if (value == 'valid') {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('userId', _useridController.text.toString());

            Navigator.of(context).pushNamedAndRemoveUntil(
                '/homepage', (Route<dynamic> route) => false,
                arguments: {'userid': _useridController.text.toString()});
          } else {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Invalid Credentials'),
              backgroundColor: Colors.red,
            ));
            setState(() {
              _isLoading = false;
            });
          }
        },
        error: (_, __) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Some error occured'),
          backgroundColor: Colors.red,
        )),
        loading: () => const CircularProgressIndicator(),
      );
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    String imgUrl =
        "https://firebasestorage.googleapis.com/v0/b/earn-money-1545d.appspot.com/o/app_images%2FPurple%20Modern%20Login%20Page%20Desktop%20Prototype%20(2)%20(2).png?alt=media&token=101d89eb-2fe1-46fc-890e-f0f28594e1bc";

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          // height: scHeight - kToolbarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: kToolbarHeight + 15,
            ),
            Text(
              'Login Account',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(48, 49, 50, 1)),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Hello, welcome back to you account',
              style: TextStyle(color: Color.fromRGBO(170, 171, 173, 1)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: scHeight * 0.3,
              width: double.infinity,
              alignment: Alignment(0, 0),
              child: ImageFetcher.getImage(imgUrl),
            ),
            SizedBox(
              height: 35,
            ),
            const Text(
              "User Id",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(96, 96, 96, 1)),
            ),
            SizedBox(
              height: 5,
            ),

            /* -------------------------------- User Id TextField ------------------------------- */

            TextFormField(
              controller: _useridController,
              decoration: InputDecoration(
                labelText: 'User Id',
                prefixIcon: Icon(Icons.person),
                alignLabelWithHint: false,
                floatingLabelStyle: TextStyle(fontSize: 0),
                helperStyle: TextStyle(fontSize: 0),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            const Text(
              "Password",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(96, 96, 96, 1)),
            ),
            SizedBox(
              height: 5,
            ),

            /* -------------------------------- Password TextField ------------------------------- */

            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
                alignLabelWithHint: false,
                floatingLabelStyle: TextStyle(fontSize: 0),
                helperStyle: TextStyle(fontSize: 0),
                border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            /* -------------------------------- Login Button ------------------------------- */

            Container(
                alignment: Alignment(0, 0),
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(135, 165, 166, 1),
                    borderRadius: BorderRadius.circular(30)),
                child: _isLoading
                    ? SpinKitThreeInOut(
                        color: Colors.white,
                      )
                    : TextButton(
                        onPressed: () => submithandler(ref),
                        child: Text(
                          'Log In',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ))),
            const SizedBox(
              height: 10,
            ),
            Text("By continuing you agree to our terms of services and policy",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w200))
          ]),
        ),
      ),
    );
  }
}
