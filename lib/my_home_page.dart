import 'package:flutter/material.dart';
import 'package:magic_ext_oauth/magic_ext_oauth.dart';
import 'package:magic_sdk/magic_sdk.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var magic = Magic("pk_live_A60A6907FD3E31B3");
    TextEditingController emailContraller = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 150),
            margin: const EdgeInsets.all(20),
            height: 400,
            width: double.infinity,
            child: Center(
              child: SizedBox(
                height: 400,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: TextField(
                        controller: emailContraller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email or Phone number",
                            hintStyle: TextStyle(color: Colors.grey[400])),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey[400])),
                      ),
                    ),
                    //textButton....
                    TextButton(
                      onPressed: () async {
                        var configuration = OAuthConfiguration(
                            provider: OAuthProvider.GITHUB,
                            redirectURI:
                                'https://codecrafts.dev/privacy-policy/');
                        var result =
                            await magic.oauth.loginWithPopup(configuration);
                        if (result.magic!.userMetadata!.email!.isNotEmpty) {}
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          height: 30,
                          width: 80,
                          color: Colors.amber,
                          child: const Center(child: Text("Login")),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
