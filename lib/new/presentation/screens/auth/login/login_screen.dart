import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traning/new/domain/providers/auth_provider.dart';
import 'package:traning/new/presentation/screens/auth/login/login_title.dart';
import 'package:traning/new/presentation/screens/auth/login/mobile_no_textfield.dart';
import 'package:traning/new/presentation/screens/auth/login/tnc_pp_text.dart';
import 'package:traning/new/shared/constants/colors.dart';
import 'package:traning/new/shared/shared_preferences/shared_preference.dart';
import 'package:traning/new/shared/utils/responsive_manager.dart';
import 'login_description.dart';
import 'verify_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
    _fetchFCMToken();
  }

  _fetchFCMToken() async {
    String fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
    if(fcmToken.isEmpty) {
      fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
    }
    PrefUtils().saveFCMToken(fcmToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _buildBody(context)),
      appBar: AppBar(
        backgroundColor: kWhite,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: kBlack),
      ),
      bottomNavigationBar: const TnCPPText(),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: ResponsiveManager.width(5)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: ResponsiveManager.height(2)),
                  child: const LoginTitle(),
                ),
                const LoginDescription(),
                Padding(
                  padding: EdgeInsets.only(
                      top: ResponsiveManager.height(8),
                      bottom: ResponsiveManager.height(2)),
                  child: Form(
                    key: provider.loginFormKey,
                    child: MobileNoTextField(
                        formKey: provider.loginFormKey,
                        controller: provider.mobileNoController,
                        focusNode: provider.mobileNoFocusNode),
                  ),
                ),
                SizedBox(height: ResponsiveManager.height(2)),
                VerifyButton(provider: provider),
              ],
            ),
          ),
        );
      },
    );
  }
}
