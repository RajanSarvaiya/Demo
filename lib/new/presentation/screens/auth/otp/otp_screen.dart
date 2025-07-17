import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traning/new/domain/providers/auth_provider.dart';
import 'package:traning/new/presentation/screens/auth/otp/otp_icon.dart';
import 'package:traning/new/presentation/screens/auth/otp/otp_textfield.dart';
import 'package:traning/new/presentation/screens/auth/otp/otp_titie.dart';
import 'package:traning/new/presentation/screens/auth/otp/resend_otp_button.dart';
import 'package:traning/new/shared/utils/responsive_manager.dart';
import 'otp_description.dart';
import 'verify_otp_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
/*  @override
  void initState() {
    super.initState();
    _clearOtpController();
    // _setDeviceId();
    _fetchDeviceUUID();
  }

  Future _fetchDeviceUUID() async {
    String uuid = await FlutterUdid.udid;
    PrefUtils().saveDeviceUUID(uuid);
  }

  void _clearOtpController() {
    var provider = Provider.of<AuthProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.clearOtpController();
    });
  }

  _setDeviceId() async {
    var deviceId = PrefUtils().getDeviceUUID();
    if (deviceId.isEmpty) {
      await _fetchDeviceUUID();
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
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
                SizedBox(height: ResponsiveManager.height(20),),
                const OtpIcon(),
                const OtpTitle(),
                Padding(
                  padding: EdgeInsets.only(bottom: ResponsiveManager.height(8)),
                  child: OtpDescription(
                    number: provider.mobileNoController.text.substring(0, 2) +
                        '*' * 5 +
                        provider.mobileNoController.text.substring(7),
                  ),
                ),
                Form(
                  key: provider.otpFormKey,
                  child: OtpTextField(
                    provider: provider,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: ResponsiveManager.height(2)),
                  child: const ResendOtpButton(),
                ),
                VerifyOtpButton(provider: provider),
              ],
            ),
          ),
        );
      },
    );
  }
}