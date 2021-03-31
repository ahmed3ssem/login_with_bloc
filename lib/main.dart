import 'package:flutter/material.dart';
import 'package:loginwithbloc/bloc/login_bloc.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            StreamBuilder(
                stream: bloc.email,
                builder: (context , snapshot){
                  return TextField(
                    onChanged:bloc.changeEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'ahmed@gmail.com',
                        labelText: 'E-Mail',
                        errorText: snapshot.error
                    ),
                  );
                },
            ),
            StreamBuilder(
              stream: bloc.password,
              builder: (context , snapshot){
                return TextField(
                  onChanged: bloc.changePassword,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                     errorText: snapshot.error
                  ),
                );
              },
            ),
            SizedBox(height: 15,),
            RaisedButton(
                onPressed: (){},
                child: Text("Login"),
                textColor: Colors.white,
                color: Colors.blue,
                )
          ],
        ),
      ),
    );
  }
}
