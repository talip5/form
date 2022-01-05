import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Form35());
}

class Form35 extends StatefulWidget {
  @override
  _StateForm35 createState() => _StateForm35();
}

class _StateForm35 extends State<Form35> {
 final TextEditingController firstNameController=TextEditingController();

  var formKey = GlobalKey<FormState>();

  String title='baslik';

  title5(){
    setState(() {
      title='Form35';
    });
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      darkTheme: ThemeData.dark(),
      title: 'Form',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 80.0,),
                    //Padding(padding: EdgeInsets.all(4.0)),
                    Row(
                      children: [
                        SizedBox(width: 30.0,),
                        Expanded(
                          child: Container(
                            width: 500,
                            height: 200,
                            color: Colors.blue,
                            child: TextFormField(
                              controller: firstNameController,
                              decoration:const InputDecoration(
                                fillColor: Colors.deepOrangeAccent,
                                filled: true,
                                //contentPadding: EdgeInsets.all(50.0),
                                labelText: 'Adi',
                                hintText: 'Engin',
                                prefixIcon: Icon(Icons.account_circle),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  /*print(value!+'xx');
                                  if(value ==''){
                                    value='Yeni deger';
                                    print(value);
                                  }
                                  print('ad girilmedi');*/
                                  return 'Please enter firstName';
                                }
                                return null;
                                //return title5();
                              },
                              onSaved: (value) {
                                //print('Adi " $value " kaydedildi');
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 30.0,),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration:const InputDecoration(
                        fillColor: Colors.orangeAccent,
                        filled: true,
                        labelText: 'Soyadi',
                        hintText: 'Demirog',
                      ),
                      onSaved: (value) {
                        print('Soyadi " $value " kaydedildi');
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          print(value);
                          return 'Please enter lastName';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                        onPressed: (){
                          print(formKey.currentState!.validate());
                          setState(() {
                            title=firstNameController.text;
                          });
                        },
                        /*onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            print('Kayit yapildi');
                          }
                          else{
                            print('Hata');
                          }
                        },*/
                        child: Text('Submit')),
                  ],
                ),
              ),
              Text('TextEditingController :'+'    '+firstNameController.text),
            ],
          ),
        ),
      ),
    );
  }
}
