import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser  {
  final String userName;
  final String fullName;
  final String phoneNumber;
  final String dateOfBirth;
  final String gender;
  final String province;
  final String address;


  AddUser(this.userName, this.fullName, this.phoneNumber,
  this.dateOfBirth,this.gender,this.province,this.address){
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users
        .add({
      'user_name': userName,
      'full_name': fullName, // John Doe
      'phone_number':phoneNumber,
      'date_of_birth':dateOfBirth,
      'gender':gender,
      'province':province,
      'address':address
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
/*
  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
        'user_name': userName,
        'full_name': fullName, // John Doe
        'phone_number':phoneNumber,
        'date_of_birth':dateOfBirth,
        'gender':gender,
        'province':province,
        'address':address
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    *//*return TextButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );*//*
  }*/
}