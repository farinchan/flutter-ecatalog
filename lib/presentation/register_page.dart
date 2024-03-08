import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/bloc/register/register_bloc.dart';
import 'package:flutter_ecatalog/data/datasources/local_datasource.dart';
import 'package:flutter_ecatalog/data/models/request/register_request_model.dart';
import 'package:flutter_ecatalog/presentation/home_page.dart';
import 'package:flutter_ecatalog/presentation/login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

TextEditingController? nameController;
TextEditingController? emailController;
TextEditingController? passwordController;

class _RegisterPageState extends State<RegisterPage> {
  
  void checkToken() async {
    final token = await LocalDataSource().getToken();
    if (token != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    checkToken();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  void dispose() {
    // TODO: implement dispose
    nameController!.dispose();
    emailController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nama',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else if (state is RegisterLoaded) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Register Success'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                }
              },
              builder: (context, state) {
                if (state is RegisterLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ElevatedButton(
                    onPressed: () {
                      // Implement registration logic here
                      final requestModel = RegisterRequestModel(
                        name: nameController!.text,
                        email: emailController!.text,
                        password: passwordController!.text,
                      );
                      context.read<RegisterBloc>().add(
                            DoRegisterEvent(model: requestModel),
                          );
                    },
                    child: Text('Register'),
                  );
                }
              },
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
              child: Text(
                'Sudah punya akun? Login',
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
