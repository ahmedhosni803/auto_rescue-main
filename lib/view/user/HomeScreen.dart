import 'package:auto_doctor/data/models/services_model.dart';
import 'package:auto_doctor/sharedWidgets/navigating/myNavigator.dart';
import 'package:auto_doctor/view/user/addCredit.dart';
import 'package:auto_doctor/view/user/support.dart';
import 'package:auto_doctor/view/user/wallet_user.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'WidgetAssitance/selectTheTypeOfWidget.dart';
import 'confirmItems.dart';
import 'history.dart';
import 'login.dart';
import 'profile_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LatLng? currentPosition;
  bool isLoading = true;
  final servicesModel = ServicesModel ;

  @override
  void initState() {
    getLocation();
    super.initState();
    servicesModel;
  }
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 252, 171, 48),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 252, 171, 48),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('assets/images/IconApp2.png'),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
              title: const Text("Profile",
                  style: TextStyle(color: Colors.black,)
              ),
              onTap: (){
                Navigator.of(context) .push(
                    MaterialPageRoute(builder: (v){
                      return ProfileUser();
                    })
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.history_rounded,
                color: Colors.black,
              ),
              title: const Text("History",
                  style: TextStyle(color: Colors.black,)
              ),
              onTap: (){
                Navigator.of(context) .push(
                    MaterialPageRoute(builder: (v){
                      return History();
                    })
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.monetization_on_outlined,
                color: Colors.black,
              ),
              title: const Text("Add Money",
                  style: TextStyle(color: Colors.black,)
              ),
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (v){
                      return AddCredit();
                    })
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.featured_play_list,
                color: Colors.black,
              ),
              title: const Text("Check Out",
                  style: TextStyle(color: Colors.black,)
              ),
              onTap: (){
                Navigator.of(context) .push(
                    MaterialPageRoute(builder: (v){
                      return ConfirmItem();
                    })
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.wallet,
                color: Colors.black,
              ),
              title: const Text("Wallet",
                  style: TextStyle(color: Colors.black,)
              ),
              onTap: (){
                Navigator.of(context) .push(
                    MaterialPageRoute(builder: (v){
                      return WalletUser();
                    })
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.manage_accounts,
                color: Colors.black,
              ),
              title: const Text("Support",
                  style: TextStyle(
                    color: Colors.black,
                  )),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (v) {
                  return Support();
                }));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: const Text("Log Out",
                  style: TextStyle(color: Colors.black,)
              ),
              onTap: (){
                MyNavigetor().pushReplacementAndRemoveUtils(LoginUser(),context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              target: currentPosition!,
              zoom: 16.0,
            ),
          ),
          SelectTheTypeOfWidget(mediaQuery: mediaQuery),
        ],
      ),
    );
  }

  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);

    setState(() {
      currentPosition = location;
      isLoading = false;
    });
  }


}
