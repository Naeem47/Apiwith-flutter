import 'package:apifucntional/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddUser extends StatelessWidget {
  AddUser({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "CREATE USER",
            style: GoogleFonts.rubik(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                  controller: name,
                  style: GoogleFonts.rubik(),
                  decoration: const InputDecoration(
                    hintText: " Name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field cannot be empty ';
                    } else {
                      return null;
                    }
                  }),
              const SizedBox(
                height: 13,
              ),
              TextFormField(
                controller: username,
                style: GoogleFonts.rubik(),
                decoration: const InputDecoration(
                  hintText: " Username",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field cannot be empty ';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 13,
              ),
              TextFormField(
                controller: email,
                style: GoogleFonts.rubik(),
                decoration: const InputDecoration(
                  hintText: " Email",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field cannot be empty ';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 13,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    createuser({
                      'name': name.text,
                      'username': username.text,
                      'email': email.text,
                    });
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Create",
                  style: GoogleFonts.rubik(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
