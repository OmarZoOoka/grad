import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:graduation_project/authentication/register_screen.dart';
import 'package:graduation_project/services/job_proposal_provider.dart';
import 'package:graduation_project/services/job_provider.dart';
import 'package:graduation_project/services/navigation_service.dart';
import 'package:graduation_project/services/project_proposal_provider.dart';
import 'package:graduation_project/services/reply_proposal_provider.dart';
import 'package:graduation_project/services/user_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<JobProvider>(create: (_) => JobProvider()),
        ChangeNotifierProvider<JobProposal>(create: (_) => JobProposal()),
                ChangeNotifierProvider<ReplyProposal>(create: (_) => ReplyProposal()),
        ChangeNotifierProvider<ProjectProposal>(
            create: (_) => ProjectProposal()),
        ChangeNotifierProvider<NavigationService>(
          create: (_) => NavigationService(),
        ),
      ],
      child: const FreelancerApp(),
    ),
  );
}

class FreelancerApp extends StatelessWidget {
  const FreelancerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      home: const Scaffold(
        backgroundColor: Colors.white,
        body: RegisterScreen(),
      ),
    );
  }
}
