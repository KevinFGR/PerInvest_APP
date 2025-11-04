import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perinvest_app/app/auth/auth.controller.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
   extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.amber[900]!, 
              const Color.fromARGB(255, 0, 16, 28)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              "PerInvest",
              style: TextStyle(
                color:Colors.white,
                fontSize:30,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height:60),

            // Email
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            
            CupertinoTextField(
              padding: const EdgeInsets.symmetric(
                vertical:18,
                horizontal:16
              ),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              placeholder: "email@email.com",
              placeholderStyle: const TextStyle(
                color:Colors.white70, 
                fontSize:14
              ),
              style: const TextStyle(
                color: Colors.white, 
                fontSize: 14
              ),
              decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
            ),
            const SizedBox(height:8),

            // Senha
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Senha',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              obscureText: true,
              padding: const EdgeInsets.symmetric(
                vertical:18,
                horizontal: 16
              ),
              controller: passController,
              placeholder: "********",
              placeholderStyle: const TextStyle(color:Colors.white70, fontSize:14),
              style: const TextStyle(
                color: Colors.white, 
                fontSize: 14
              ),
              decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
            ),
            const SizedBox(height:30),

            // Acessar
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                color: Colors.amber[900],
                child: Text(
                  isLoading ? "carregando..." : "Acessar",
                  style:TextStyle(
                    color: Colors.white, 
                    fontSize: 15, 
                    fontWeight: FontWeight.w900
                  )
                ),
                onPressed: () async  { 
                  if(isLoading) return;

                  setState(() => isLoading = true);
                  bool login = await LoginController.auth( emailController.text, passController.text );
                  if(context.mounted && login){
                    LoginController.openCryptosPage(context);
                  }
                  setState(() => isLoading = false);
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}