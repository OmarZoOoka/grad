import 'package:flutter/material.dart';
import 'package:graduation_project/Components/components.dart';
import 'package:graduation_project/authentication/freelancer_signup_screen.dart';
import 'package:graduation_project/constants.dart';

import 'package:graduation_project/services/user_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).fetchCategories();
    var userProvider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: KoffwhiteColor,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              appName,
              style: TextStyle(fontWeight: FontWeight.bold, color: KgreenColor),
            ),
            
          ],
        ),
        leading: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Image.asset(
                "assets/images/logo.png",
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/freelancer-person.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    
                      
                    
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 500,
                width: double.infinity,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Welcome to FreelancerHub",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Input(
                        con: userProvider.emailController,
                        enter: TextInputType.emailAddress,
                        lab: "Email",
                        pre: const Icon(Icons.email),
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Input(
                        con: userProvider.passwordController,
                        lab: "Password",
                        pre: const Icon(Icons.lock),
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password is required";
                          }
                          return null;
                        },
                        isObsecure:
                            Provider.of<UserProvider>(context, listen: true)
                                .secure,
                        suf: Provider.of<UserProvider>(context, listen: true)
                                .secure
                            ? Icons.visibility_off
                            : Icons.visibility,
                        suffunf: () {
                          userProvider.setSecure();
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      loginButton(
                        buttonText: 'Login',
                        () {
                          if (_formKey.currentState!.validate()) {
                            userProvider.login(context);
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                userProvider.disposeAlldata();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterAsFreelancerScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Create one now",
                                style: TextStyle(
                                  color: KgreenColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
