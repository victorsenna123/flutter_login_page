//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../config/palette.dart';

String emailLogin = "victor@crea-rj.org.br";
String senhalogin = "123";

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key key}) : super(key: key);


  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool ehTelaDeCadastro = true;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/crea-rj.png"),
                      fit: BoxFit.fill)),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: Color(0xFF3b5999).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "bem vindo ao",
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Colors.yellow[700],
                          ),
                          children: [
                            TextSpan(
                              text: ehTelaDeCadastro ? " crea," : " portal,",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[700],
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      ehTelaDeCadastro
                          ? "Registre-se para continuar"
                          : "Faca o login para continuar",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          buildBottomHalfContainer(),
          //container principal para login e cadastro
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: ehTelaDeCadastro ? 200 : 230,   // ?padrao 200 : 230,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: ehTelaDeCadastro ? 380 : 250, // padrao 380, 250
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  //borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              ehTelaDeCadastro = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !ehTelaDeCadastro
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              ehTelaDeCadastro = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "CADASTRO",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ehTelaDeCadastro
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    if (ehTelaDeCadastro) buildSignupSection(),
                    if (!ehTelaDeCadastro) buildSigninSection()
                  ],
                ),
              ),
            ),
          ),
          buildBottomHalfContainer(), // afeta o botao de submit a fim de que ele esteja acima do container
        ],
      ),
    );
  }

  Container buildSigninSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(Icons.mail_outline, "info@demouri.com", false, true),
          buildTextField(MaterialCommunityIcons.lock_outline, "**********", true, false),
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(MaterialCommunityIcons.account_outline, "Usuário",
              false, false),
          buildTextField(
              MaterialCommunityIcons.email_outline, "email", false, true),
          buildTextField(
              MaterialCommunityIcons.lock_outline, "senha", true, false),
          Padding(
            padding: const EdgeInsets.only(top: 0, left: 0),
          ),
        ],
      ),
    );
  }

  
  Widget buildBottomHalfContainer() {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: ehTelaDeCadastro ? 535/*altera a posicao do botao de submit na tela do sign up(registre-se)*/ : 430,/*altera a posicao do botao de submit na tela de login*/ // se eu estiver na tela do sign up eu ponho esta altura determinado, caso contrario eu ponho a outra altura epsecificada no final
      right: 0,left: 0, // seta-los como zeros alinha meu botao ao centro
      child: Center(  // filho, ou seja, especifica o conteudo interno que no caso é a animacao da arrow com o background
        child: ElevatedButton(
          child: Text("clique aqui"),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(30.0),
          ),
          onPressed: (() {
            print("oi");
          }),
          
          // height: 90,
          // width: 90, //padding: EdgeInsets.all(0),
          // decoration: BoxDecoration(
          //     color: Colors.blue, //borderRadius: BorderRadius.circular(0),
          //    ),
          // child: 
          //      Container(decoration: BoxDecoration(color: Colors.blue,
          //             borderRadius: BorderRadius.circular(30),
          //           ),
          //         child: Icon(
          //           Icons.arrow_forward,
          //           color: Colors.white,
          //         ), // uma 'arvore' composta por  
          //       )
        ),     
      ),
    );
  }
  Widget buildTextField(
      IconData icon, String hintText, bool isPassword, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: TextField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Palette.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );
  }
}