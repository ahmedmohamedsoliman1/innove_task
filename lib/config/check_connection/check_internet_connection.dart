import 'package:connectivity_plus/connectivity_plus.dart';

Future <bool> checkConnection () async{
  final List <ConnectivityResult> results = await Connectivity().checkConnectivity();

  if (results.contains(ConnectivityResult.mobile) || results.contains(ConnectivityResult.wifi)){
    return true ;
  }else {
    return false ;
  }
}