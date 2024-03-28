import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AuthService extends ChangeNotifier {
  User? currentUser() {
    // 현재 유저(로그인 되지 않으면 null 반환)
    return FirebaseAuth.instance.currentUser;
  }

  void signUp({
    required String email,
    required String password,
    required String password2,
    required Function() onSuccess,
    required Function(String err) onError,
    String? profileImageUrl,
  }) async {
    //회원가입
    if (email.isEmpty) {
      onError('이메일을 입력해주세요');
      return;
    } else if (password.isEmpty) {
      onError('비밀번호를 입력해주세요.');
      return;
    }
    // firebase auth 회원가입
    try {
      // 회원가입 시도
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // 성공하면
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError('비밀번호를 6자리 이상 입력해 주세요.');
      } else if (e.code == 'email-already-in-use') {
        onError('이미 가입된 이메일 입니다.');
      } else if (e.code == 'invalied-email') {
        onError('이메일 형식을 확인해주세요.');
      } else if (e.code == 'user-not-found') {
        onError('일치하는 이메일이 없습니다.');
      } else if (e.code == 'wrong-password') {
        onError('비밀번호가 일치하지 않습니다.');
      } else {
        onError(e.message!);
      }
      // firebase auth 에러 발생
      // ! => null을 강제로 벗겨준다.
      onError(e.message!);
    } catch (e) {
      // firebase auth 이외에 에러 발생
      onError(e.toString());
    }
  }

  void signIn({
    required String email,
    required String password,
    required Function() onSuccess,
    required Function(String err) onError,
  }) async {
    //로그인 입력 검증
    if (email.isEmpty) {
      onError('이메일을 입력해주세요');
      return;
    } else if (password.isEmpty) {
      onError('비밀번호를 입력해주세요.');
      return;
    }
    //로그인 시도
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      //성공시 호출
      onSuccess();

      //로그인 상태 변경알림
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      // FireBase Auth 에러가 발생했을 때
      onError(e.message!);
    } catch (e) {
      onError(e.toString());
    }
  }

  void signOut() async {
    //로그아웃
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  Future<String?> uploadProfileImage(String imagePath) async {
    try {
      // 현재 사용자 가져오기
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        return null;
      }

      // Firebase Storage에 이미지 업로드
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(user.uid + '.jpg');

      await ref.putFile(File(imagePath));

      // 업로드된 이미지의 다운로드 URL 반환
      String downloadURL = await ref.getDownloadURL();

      return downloadURL;
    } catch (e) {
      print('Error uploading profile image: $e');
      return null;
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // AuthService 클래스에 사용자 정보 업데이트 메서드 추가
  Future<void> updateProfilePicture(String imageUrl) async {
    try {
      await _auth.currentUser!.updatePhotoURL(imageUrl);
    } catch (e) {
      throw e;
    }
  }
}
