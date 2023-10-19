import 'package:flutter/material.dart';
import 'package:projet_inc_dec/screens/increment.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});


  @override
  _ConnexionPageState createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;
  RegExp emailValid = RegExp(
    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=/^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
  );

  bool _isFormValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formfield,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 252,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Entrez votre Email";
                    }
                    if (!emailValid.hasMatch(value)) {
                      return "Entrez un Email valide";
                    }
                    return null;
                  },
                  onChanged: (_) {
                    _updateFormValidation();
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 252,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: passController,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                        passToggle ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Entrez le mot de passe";
                    } else if (passController.text.length < 8) {
                      return "Le mot de passe ne doit pas être inférieur à 8 caractères";
                    }
                    return null;
                  },
                  onChanged: (_) {
                    _updateFormValidation();
                  },
                ),
              ),
              SizedBox(height: 23),
              InkWell(
                onTap: () {
                  if (_isFormValid) {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return IncrementPage();
                        },
                      ),
                    );
                  } else {
                   
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Connexion Requise"),
                          content: Text("Veuillez vous connecter avant d'accéder à cette page."),
                          actions: [
                            TextButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop(); // Fermer l'alerte
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Container(
                  width: 256,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Connexion",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateFormValidation() {
    setState(() {
      _isFormValid = _formfield.currentState?.validate() ?? false;
    });
  }
}
