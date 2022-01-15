import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdService {
  final FirebaseFirestore _fireStore;
  final FirebaseStorage storage;
  AdService(this._fireStore, this.storage);

  Future<void> createAd(String houseName, String area, String city, String address, String type, double rent) {
    // Call the ad's CollectionReference to add a new ad
    CollectionReference ads = _fireStore.collection('ads');
    return ads
        .add({
      'houseName': houseName,
      'area': area,
      'city': city,
      'address': address,
      'type': type,
      'rent': rent,
      'images': ['images1url', 'image2url'],
    })
        .then((value) => print("Ad Created"))
        .catchError((error) => print("Failed to create Ad: $error"));
  }


}