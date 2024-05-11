import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:graduation_project/Components/flush_bar.dart';
import 'package:graduation_project/authentication/register_screen.dart';
import 'package:graduation_project/screens/client_home_screen.dart';
import 'package:graduation_project/screens/freelancer_home_screen.dart';
import 'package:graduation_project/services/navigation_service.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class UserProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? userId;
  String? userToken;
  List<Map<String, dynamic>> categories = [];

  bool secure = true;
  bool secure2 = true;

  void setUserId(String id) {
    userId = id;
    notifyListeners();
  }

  void setUserToken(String token) {
    userToken = token;
    notifyListeners();
  }

  setSecure() {
    secure = !secure;
    notifyListeners();
  }

  setSecure2() {
    secure2 = !secure2;
    notifyListeners();
  }

  disposeAlldata() {
    emailController.text = "";
    passwordController.text = "";
    nameController.text = "";
    accountController.text = '';
    confirmPasswordController.text = "";
    secure2 = true;
    secure = true;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    EasyLoading.show(status: 'loading...');
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:5140/api/Account/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final statusCode = responseData['statusCode'];

        if (statusCode == 202) {
          await EasyLoading.dismiss();
          final role = responseData['result']['role'];
          final id = responseData['result']['Id'];
          final token = responseData['result']['token'];

          Provider.of<UserProvider>(context, listen: false).setUserId(id);
          Provider.of<UserProvider>(context, listen: false).setUserToken(token);

          if (role == 'Freelancer') {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => HomeScreen(
                  selectedCategories: [],
                ),
              ),
            );
          } else if (role == 'Client') {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => const ClientHomeScreen(),
              ),
            );
          }

          showFlushBar('Login Successful', isError: false);
          disposeAlldata();
        } else {
          EasyLoading.dismiss();
          showFlushBar(responseData['message'] ?? 'Login failed');
        }
      } else {
        EasyLoading.dismiss();
        showFlushBar('Login failed');
      }
    } catch (e) {
      EasyLoading.dismiss();
      showFlushBar('Something went wrong: $e');
    }
  }

  Future<void> signupAsFreelancer(int selectedCategoryId) async {
    await _signup(
      emailController.text,
      passwordController.text,
      nameController.text,
      'Freelancer',
      selectedCategoryId: selectedCategoryId,
    );
  }

  Future<void> signupAsClient() async {
    await _signup(
      emailController.text,
      passwordController.text,
      nameController.text,
      'Client',
    );
  }

  Future<void> _signup(
    String email,
    String password,
    String name,
    String accountType, {
    int? selectedCategoryId,
  }) async {
    EasyLoading.show(status: 'loading...');
    try {
      final endpoint = accountType == 'Freelancer'
          ? 'http://10.0.2.2:5140/api/Account/register/freelancer'
          : 'http://10.0.2.2:5140/api/Account/register/client';

      final body = <String, dynamic>{
        'email': email,
        'password': password,
        'confirmPassword': confirmPasswordController.text,
        'name': name,
        'accountType': accountType,
        'categoryId': selectedCategoryId,
      };

      final response = await http.post(
        Uri.parse(endpoint),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 201) {
        await EasyLoading.dismiss();
        final responseData = jsonDecode(response.body);
        final role = responseData['result']['role'];

        if (role == 'Freelancer') {
          Navigator.of(NavigationService.context!).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(
                selectedCategories: [selectedCategoryId!],
              ),
            ),
          );
        } else if (role == 'Client') {
          Navigator.of(NavigationService.context!).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => const ClientHomeScreen(),
            ),
          );
        }
        showFlushBar('Account Created Successfully', isError: false);
        disposeAlldata();
      } else {
        EasyLoading.dismiss();
        final responseData = jsonDecode(response.body);
        showFlushBar(responseData['message'] ?? 'Signup failed');
      }
    } catch (e) {
      EasyLoading.dismiss();
      showFlushBar('Something went wrong: $e');
    }
  }

  Future<void> fetchCategories() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:5140/api/Category'),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final List<dynamic> categoryList = responseData['result'];
        categories.clear();
        categories.addAll(categoryList.map((e) => {
              'id': e['id'],
              'name': e['name'],
              'imageUrl': e['imageUrl'],
            }));
      } else {
        final responseData = jsonDecode(response.body);
        showFlushBar(responseData['message'] ?? 'Failed to fetch categories');
      }
    } catch (e) {
      showFlushBar('Error fetching categories: $e');
    }
  }

  Future<void> changeUserDataForUser(
    String imageUrl,
    String phoneNumber,
    List<String> skills,
  ) async {
    try {
      final userId = this.userId;
      final userToken = this.userToken;
      if (userId != null) {
        final endpoint = 'http://localhost:5140/api/Freelancer/$userId';

        final body = <String, dynamic>{
          'imageUrl': imageUrl,
          'phoneNumber': phoneNumber,
          'skills': skills,
        };

        final response = await http.put(
          Uri.parse(endpoint),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $userToken',
          },
          body: jsonEncode(body),
        );

        if (response.statusCode == 200) {
          showFlushBar('Data Updated Successfully', isError: false);
        } else {
          print("Error updating user data: ${response.statusCode}");
          // Optionally, you can print the response body for more information
          print("Response body: ${response.body}");
        }
      } else {
        // Handle error case
        print("User ID is null");
      }
    } catch (e) {
      // Handle error case
      print("Error : $e");
    }
  }

  logout() async {
    Navigator.pushAndRemoveUntil(
      NavigationService.context!,
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
      (route) => false,
    );
    Future.delayed(const Duration(milliseconds: 200), () {
      showFlushBar("Logged Out Successfully", isError: false);
    });
  }
}
