import 'package:flutter/material.dart';
import 'package:get/get.dart';

showLoading(){
  Get.defaultDialog(
    backgroundColor: const Color.fromARGB(255, 181, 183, 184),
    title: "Loading...",
    content: const CircularProgressIndicator(),
    barrierDismissible: false
  );
}

dismissLoadingWidget(){
  Get.back();
}