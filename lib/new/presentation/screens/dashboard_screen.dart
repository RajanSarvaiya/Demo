import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:provider/provider.dart';
import 'package:traning/new/domain/providers/dashboard/dashboard_provider.dart';
import 'package:traning/new/presentation/widgets/bottom_bar_items.dart';
import 'package:traning/new/shared/constants/colors.dart';
import 'package:traning/new/shared/utils/textstyles/regular_textstyles.dart';
import 'package:traning/new/shared/widgets/exit_app_dailog.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final GifController controller1, controller2, controller3, controller4;

  @override
  void initState() {
    super.initState();
    controller1 = GifController(vsync: this);
    controller2 = GifController(vsync: this);
    controller3 = GifController(vsync: this);
    controller4 = GifController(vsync: this);

    var provider = Provider.of<DashboardProvider>(context, listen: false);
    if (provider.navigationQueue.isEmpty) {
      provider.navigationQueue.add(0);
    }
    provider.currentIndex =  0;
    // setupFirebaseMessagingListeners();
    // setupInitialMessage();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  void _onTapped(int index, DashboardProvider provider) {
    if (index == 0) {
      provider.navigationQueue.clear();
    }
    provider.onTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        var provider = Provider.of<DashboardProvider>(context, listen: false);
        if (provider.currentIndex != 0) {
          _onTapped(0, provider);
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return const ExitApplicationDialog();
            },
          );
        }
      },
      child: Consumer<DashboardProvider>(
        builder: (BuildContext context, provider, Widget? child) {
          return Scaffold(
            // key: _scaffoldKey,
            bottomNavigationBar: _buildBottomNavigationBar(provider),
            body: _buildBody(provider),
          );
        },
      ),
    );
  }

  Widget _buildBody(DashboardProvider provider) {
    switch (provider.currentIndex) {
      case 0:
        // return const HomeScreen();
      case 1:
        // return FavouriteScreen();
      case 2:
        // return CartScreen();
      case 3:
        // return ProfileScreen();
      default:
        return const SizedBox();
    }
  }

  Widget _buildBottomNavigationBar(DashboardProvider provider) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite,
        iconSize: 15.0,
        unselectedItemColor: kGrey,
        selectedItemColor: kOrange,
        unselectedLabelStyle: text14RegularGrey,
        selectedLabelStyle: text14RegularPrimary,
        currentIndex: provider.currentIndex,
        elevation: 10,
        onTap: (index) {
          if (provider.currentIndex != index) {
            _onTapped(index, provider);
          }
        },
        items: BottomNavItems.getItems(
          context,
          controller1,
          controller2,
          controller3,
          controller4,
        ));
  }

}
