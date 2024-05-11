import 'package:flutter/material.dart';
import 'package:graduation_project/Components/components.dart';
import 'package:graduation_project/authentication/freelancer_signup_screen.dart';
import 'package:graduation_project/authentication/register_screen.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/screens/client_home_screen.dart';
import 'package:graduation_project/services/user_provider.dart';
import 'package:provider/provider.dart';

class RegisterAsClientScreen extends StatefulWidget {
  const RegisterAsClientScreen({Key? key}) : super(key: key);

  @override
  State<RegisterAsClientScreen> createState() => _RegisterAsClientScreenState();
}

class _RegisterAsClientScreenState extends State<RegisterAsClientScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isClientSelected = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: KoffwhiteColor,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Freelancer',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: KgreenColor),
            ),
            Text(
              'Hub',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                color: KgreenColor,
              ),
            ),
          ),
        ),
        
      ),
      body: SingleChildScrollView(
        child: Column(children: [
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign up',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Row(
                    children: [
                      Text(
                        'Home / ',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        'Register',
                        style: TextStyle(fontSize: 16, color: KgreenColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isClientSelected = true;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    isClientSelected ? Colors.green : Colors.white,
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    isClientSelected ? Colors.white : Colors.black,
                  ),
                ),
                child: Text('Client'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterAsFreelancerScreen(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    isClientSelected ? Colors.white : KgreenColor,
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    isClientSelected ? Colors.black : Colors.white,
                  ),
                ),
                child: Text('Freelancer'),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 700,
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Create your Client account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Input(
                      con: userProvider.nameController,
                      lab: "Name",
                      pre: Icon(Icons.person_outline),
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name is required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Input(
                      con: userProvider.emailController,
                      enter: TextInputType.emailAddress,
                      lab: "Email",
                      pre: Icon(Icons.email),
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Input(
                      con: userProvider.passwordController,
                      lab: "Password",
                      pre: Icon(Icons.lock),
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
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        }
                        RegExp passwordPattern = RegExp(
                          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^a-zA-Z0-9]).{6,}$',
                        );
                        if (!passwordPattern.hasMatch(value)) {
                          return "Password must contain at least one lowercase letter\n one uppercase letter\n one digit\n one special character\n and be at least 6 characters long.";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Input(
                      con: userProvider.confirmPasswordController,
                      lab: "Repeat Password",
                      pre: Icon(Icons.lock),
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        } else if (value !=
                            userProvider.passwordController.text) {
                          return "Password does not match";
                        }
                        return null;
                      },
                      isObsecure:
                          Provider.of<UserProvider>(context, listen: true)
                              .secure2,
                      suf: Provider.of<UserProvider>(context, listen: true)
                              .secure2
                          ? Icons.visibility_off
                          : Icons.visibility,
                      suffunf: () {
                        userProvider.setSecure2();
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    loginButton(
                      buttonText: "Register",
                      () async {
                        if (_formKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          await userProvider.signupAsClient();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClientHomeScreen(),
                            ),
                          );
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Existing User?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          GestureDetector(
                            onTap: () {
                              userProvider.disposeAlldata();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Sign in Now",
                              style: TextStyle(
                                color: KgreenColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
      
    );
  }
}
