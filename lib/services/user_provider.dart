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
  Map<String, dynamic>? userData;
  String? userId;
  String? userToken;
  List<Map<String, dynamic>> categories = [];
  List<Map<String, dynamic>> skills = [];

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
                builder: (BuildContext context) =>  ClientHomeScreen(),
              ),
            );
          }

          showFlushBar('Login Successful', isError: false);
          disposeAlldata();
        } else {
          EasyLoading.dismiss();
          print(responseData['message'] ?? 'Login failed');
        }
      } else {
        EasyLoading.dismiss();
        print('Login failed');
      }
    } catch (e) {
      EasyLoading.dismiss();
      print('Something went wrong: $e');
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
              builder: (BuildContext context) =>  ClientHomeScreen(),
            ),
          );
        }
        showFlushBar('Account Created Successfully', isError: false);
        disposeAlldata();
      } else {
        EasyLoading.dismiss();
        final responseData = jsonDecode(response.body);
        print(responseData['message'] ?? 'Signup failed');
      }
    } catch (e) {
      EasyLoading.dismiss();
      print('Something went wrong: $e');
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
        print(responseData['message'] ?? 'Failed to fetch categories');
      }
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  Future<void> fetchSkills() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:5140/api/Skill'),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final List<dynamic> skillData = responseData['result'];

        skills.addAll(skillData.map((e) => {
              'id': e['id'],
              'name': e['name'],
            }));
        notifyListeners();
      } else {
        final responseData = jsonDecode(response.body);
        print(responseData['message'] ?? 'Failed to fetch Skills');
      }
    } catch (e) {
      throw Exception('Error fetching skills: $e');
    }
  }

  Future<void> changeUserDataForUser(
    String name,
    String imageUrl,
    String phoneNumber,
    {List<int>? skills,}
  ) async {
    try {
      final userId = this.userId;
      final userToken = this.userToken;
      if (userId != null) {
        final endpoint = 'http://10.0.2.2:5140/api/Freelancer/$userId';

        var formData = http.MultipartRequest('PUT', Uri.parse(endpoint));
        formData.fields.addAll({
          'name': name,
          'phoneNumber': phoneNumber,


        });

        if (imageUrl.isNotEmpty) {
          formData.files.add(
            await http.MultipartFile.fromPath('image', imageUrl),
          );
        }

        formData.headers.addAll({
          'Authorization': 'Bearer $userToken',
        });

        final response = await http.Response.fromStream(await formData.send());

        if (response.statusCode == 200) {
          showFlushBar('Data Updated Successfully', isError: false);
          print(response.body);
          print(formData.fields['skills']);
        } else {
          print("Error updating user data: ${response.statusCode}");
          print("Response body: ${response.body}");
        }
      } else {
        print("User ID is null");
      }
    } catch (e) {
      print("Error : $e");
    }
  }

  Future<void> getClientData() async {
    try {
      final userId = this.userId;

      final endpoint = 'http://10.0.2.2:5140/api/Client/$userId';

      final response = await http.get(
        Uri.parse(endpoint),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8',
        },
      );

      if (response.statusCode == 200) {
        userData = jsonDecode(response.body);
        notifyListeners();
      } else {
        print(response.statusCode);
        throw Exception('Failed to load user data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
 Future<void> getFreelancerData() async {
    try {
      final userId = this.userId;

      final endpoint = 'http://10.0.2.2:5140/api/Freelancer/$userId';

      final response = await http.get(
        Uri.parse(endpoint),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8',
        },
      );

      if (response.statusCode == 200) {
        userData = jsonDecode(response.body);
        notifyListeners();
      } else {
        print(response.statusCode);
        throw Exception('Failed to load user data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
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
