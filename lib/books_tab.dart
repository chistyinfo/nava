import 'package:flutter/material.dart';
import 'package:nava/tube_player.dart';
import 'package:nava/video_call.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BooksTab extends StatefulWidget {
  @override
  _BooksTabState createState() => _BooksTabState();
}

class _BooksTabState extends State<BooksTab> {
  //variables
  var _isLoading = true;
  var banks;

  // This supermethod called to load listview in main page
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    print("Attempting to fetch data from network");
    final url =
        "https://greendustbdplus.000webhostapp.com/pigi_money/pigi_bolg.json";

    final response = await http.get(url);
    if (response.statusCode == 200) {
      ///Fetch data from url and keep it in map variable then
      ///keep the specefic item in specefic varibles.
      final map = json.decode(response.body);
      final banksJson = map["banks"];

      setState(() {
        _isLoading = false;
        this.banks = banksJson;
      });
    }
  }

  //-------------Control on system back button---------------
  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Do you want to exit?"),
              actions: <Widget>[
                FlatButton(
                  child: Text("No"),
                  textColor: Colors.black,
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                    child: Text("Yes"),
                    textColor: Colors.black,
                    onPressed: () => Navigator.pop(context, true))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    //Admob part 1
    // FirebaseAdMob.instance
    //     .initialize(appId: "ca-app-pub-2233261441949271~9887957918");
    // myBanner
    //   ..load()
    //   ..show();

    // //Admob ------InterstialAd
    // myInterstitial
    //   ..load()
    //   ..show(
    //     anchorType: AnchorType.bottom,
    //     anchorOffset: 0.0,
    //   );
    //------ Here return WillpopScope to exit purpose --------------
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Audio Books List'),
          backgroundColor: Colors.redAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                print("Reloading...............");
                setState(() {
                  _isLoading = true;
                  _fetchData();
                });
              },
            )
          ],
        ),
        body: Center(
          child: _isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: this.banks != null ? this.banks.length : 0,
                  itemBuilder: (context, i) {
                    final bank = this.banks[i];
                    return SizedBox(
                        width: double.infinity,

                        // height: double.infinity,
                        child: new FlatButton(
                          padding: EdgeInsets.all(0.0),

                          //call the VideoCall method
                          child: VideoCall(bank),
                          // child:TubePlayer(bank),
                         
                          onPressed: () {
                            //To go 2nd Activity
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        // DetailPage(banks[i])
                                        TubePlayer(banks[i])
                                        ));
                          },
                        ));
                  },
                ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  DetailPage(this.banks);
  final banks;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("Details Page"),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 300,
              width: 400,
              child: GridTile(
                child: Container(
                    color: Colors.white,
                    ),
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      banks["name"],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            ListTile(
              title: Text(banks["details"]),
            )
          ],
        ));
  }
}

// Addmob part 2. Inisilize of Addmob add
// MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
//   keywords: <String>['games', 'pubg'],
//   contentUrl: 'https://flutter.io',
//   birthday: DateTime.now(),
//   childDirected: false,
//   designedForFamilies: false,
//   gender:
//       MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
//   testDevices: <String>[], // Android emulators are considered test devices
// );

// BannerAd myBanner = BannerAd(
//   // Replace the testAdUnitId with an ad unit id from the AdMob dash.
//   // https://developers.google.com/admob/android/test-ads
//   // https://developers.google.com/admob/ios/test-ads
//   adUnitId: BannerAd.bannerAdUnitId,
//   size: AdSize.smartBanner,
//   targetingInfo: targetingInfo,
//   listener: (MobileAdEvent event) {
//     print("BannerAd event is $event");
//   },
// );

// InterstitialAd myInterstitial = InterstitialAd(
//   // Replace the testAdUnitId with an ad unit id from the AdMob dash.
//   // https://developers.google.com/admob/android/test-ads
//   // https://developers.google.com/admob/ios/test-ads
//   adUnitId: InterstitialAd.intAdUnitId,
//   targetingInfo: targetingInfo,
//   listener: (MobileAdEvent event) {
//     print("InterstitialAd event is $event");
//   },
// );
