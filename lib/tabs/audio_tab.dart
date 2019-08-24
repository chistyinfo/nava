import 'package:flutter/material.dart';
import 'package:nava/pages/tube_player.dart';
import 'package:nava/pages/audio_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AudioTab extends StatefulWidget {
  @override
  _AudioTabState createState() => _AudioTabState();
}

class _AudioTabState extends State<AudioTab> {
  //variables
  var _isLoading = true;
  var databox;

  /// This initState is called  _fetchData() method when the app start */
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
      /// Fetch data from url and keep it in 'map' variable then-the variable 'map' is assigned in 'boxJson'.

      final map = json.decode(response.body);
      /**
       * ! Here 'map['banks']' is json header of server file "pigi_money.json"
       * */
      final boxJson = map["banks"];

      setState(() {
        _isLoading = false;
        this.databox = boxJson;
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
          title: Text('Audio Audio List'),
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
                  itemCount: this.databox != null ? this.databox.length : 0,
                  itemBuilder: (context, i) {
                    final box = this.databox[i];
                    return SizedBox(
                        width: double.infinity,

                        /**
                        * 'FlatButton' user to wrap the code to push next activity
                        *! Without using 'FlatButton' you can't navigate to next activity
                        */
                        child: new FlatButton(
                          padding: EdgeInsets.all(0.0),

                          //*Call the AudioList method to show list of Audios
                          child: AudioList(box),
                          //*Click item to go 2nd Activity
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TubePlayer(databox[i])));
                          },
                        ));
                  },
                ),
        ),
      ),
    );
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
