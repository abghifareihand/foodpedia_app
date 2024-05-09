import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodpedia_app/data/models/auth_response_model.dart';

class AuthRemoteDatasource {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Either<String, UserResponseModel>> login(
      String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserResponseModel userResponse = UserResponseModel(
        id: userCredential.user!.uid,
        email: userCredential.user!.email,
      );

      log('Register response: ${userResponse.id}, ${userResponse.email}');
      return Right(userResponse);
    } on FirebaseAuthException catch (e) {
      return Left(e.code);
    }
  }

  Future<Either<String, UserResponseModel>> register(
      String name, String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserResponseModel userResponse = UserResponseModel(
        id: userCredential.user!.uid,
        email: email,
        name: name,
      );

      log('Register response: ${userResponse.id}, ${userResponse.email}, ${userResponse.name}');

      await firestore.collection('users').doc(userResponse.id).set({
        'id': userCredential.user!.uid,
        'name': name,
        'email': email,
      });
      return Right(userResponse);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, UserResponseModel>> getUserById(String userId) async {
    try {
      DocumentSnapshot snapshot =
          await firestore.collection('users').doc(userId).get();
      UserResponseModel userResponse = UserResponseModel(
        id: userId,
        name: snapshot['name'],
        email: snapshot['email'],
      );
      return Right(userResponse);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> logout() async {
    try {
      await auth.signOut();
      return const Right('Logout successful');
    } catch (e) {
     return Left(e.toString());
    }
  }
}
