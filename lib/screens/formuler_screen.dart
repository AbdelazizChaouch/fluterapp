// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/validation_screen.dart';

import '../widgets/my_button.dart';

final _formkey = GlobalKey<FormState>();

class FormulerScreen extends StatefulWidget {
  static const String ScreenRoute = 'formuler_screen';

  const FormulerScreen({super.key});

  @override
  _FormulerScreenState createState() => _FormulerScreenState();
}

class _FormulerScreenState extends State<FormulerScreen> {
  List<String> itemsList = [
    "EE015-ENCARTONNEUSE CAM2",
    "EE016-VIGNETTEUSE ETIPACK CAM2",
    "EE017-FARDELEUSE CAM2",
    "EEE301-VIGNETEUSE CAMP-100",
    "EE302-ENCARTONEUSE CMP-100",
    "EE303-FARDELEUSE SB300",
    "EE304-ETIQUETEUSE AVARY",
    "EE305-PLIEUSE DES NOTICES",
    "EE306-TETE DE POSE ETTIPACK",
    "EE308-ENCARTONNEUSE MARCHESINI INTEGRA",
    "EE309-ETIQUETTEUSE MARCHESINI",
    "EE310-BANDEROLEUSE MARCHESINI"
  ];
  List<String> itemsList2 = ["Maintenance", "Entretien"];
  String? selectedItem = "EE015-ENCARTONNEUSE CAM2";
  String? selectedItem2 = "Maintenance";

  late String iD;
  late String equipement;
  late String intervention;
  late String reclamation;

  //final _auth = FirebaseAuth.instance;
  //late User signedinUser;

  @override
  Widget build(BuildContext context) {
    //line athaya yarbatni bel fire base
    CollectionReference lettre_de_reclamation =
        FirebaseFirestore.instance.collection("lettre de réclamation");
    //addd function
    Future<void> addLettreDeReclamation() {
      return lettre_de_reclamation
          .add({
            "ID": iD,
            "equipement code": selectedItem,
            "l'intervention": selectedItem2,
            "reclamation": reclamation,
          })
          .then((value) => print("recalamation add"))
          .catchError((error) => print("Faild $error"));
    }

    const String id1 = '''àà&éàé"àé(''';
    const String id2 = '''àà&é_ç--(ç''';
    const String id3 = '''àà&"-é-éçà''';
    const String id4 = '''àà&&è_"à'(''';

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Row(
            children: [
              //Image.asset('images/logo.jpg', height: 25),
              SizedBox(width: 25),
              Text('')
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ID******************************************
                //const SizedBox(height:),
                const Text(
                  " donner votre ID",
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(180, 0, 0, 0)),
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    iD = value;
                  },
                  validator: (id) =>
                      id != id1 && id != id2 && id != id3 && id != id4
                          ? "Id n'exist pas"
                          : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    hintText: 'Enter your ID',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                // donner votre equipement ////////////////////////////////////////////
                const Text(
                  " donner votre equipement",
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(180, 0, 0, 0)),
                ),
                Center(
                  child: Column(children: <Widget>[
                    DropdownButton(
                      value: selectedItem,
                      underline: Container(
                        height: 2,
                        color: Colors.blue[400],
                      ),
                      items: itemsList
                          .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 14),
                              )))
                          .toList(),
                      onChanged: (item) => setState(() => selectedItem = item),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                  ]),
                ),

                // DECLARTION DE TEXT
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  " donner le nom de l'intervention",
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(180, 0, 0, 0)),
                ),

                // donner le nom de l'intervention
                Center(
                  child: Column(children: <Widget>[
                    DropdownButton(
                      value: selectedItem2,
                      underline: Container(
                        height: 2,
                        color: Colors.blue[400],
                      ),
                      items: itemsList2
                          .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 14),
                              )))
                          .toList(),
                      onChanged: (item) => setState(() => selectedItem2 = item),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                  ]),
                ),

                const SizedBox(
                  height: 10,
                ),
                const Text(
                  " donner votre reclamation ",
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(180, 0, 0, 0)),
                ),
                TextFormField(
                  minLines: 1,
                  maxLines: 10,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    reclamation = value;
                  },
                  validator: (text) =>
                      text!.length < 10 ? 'ecrire votre réclamation' : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    hintText: 'Problème',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),

                //ajout buttone
                const SizedBox(height: 30),
                MyButton(
                  color: Colors.blue[900]!,
                  title: 'Ajouter',
                  onPressed: () {
                    addLettreDeReclamation();
                    if (_formkey.currentState!.validate() == true) {
                      Navigator.pushNamed(
                          context, ValidationScreen.ScreenRoute);
                    } else {}
                  },
                )
              ],
            ),
          ),
        ));
  }
}
