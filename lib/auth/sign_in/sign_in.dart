import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_scheduler/auth/sign_in/sign_in_controller.dart';
import 'package:task_scheduler/auth/sign_in/sign_in_model.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve the SignInProvider from the context
    final provider = Provider.of<SignInProvider>(context, listen: false);

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hey Developer \nSign In to continue!',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              EmailField(),
              const SizedBox(height: 20),
              PasswordField(),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    provider.login();
                  },
                  child: Text('Sign In'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 234, 64, 7),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
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
}

class EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SignInModel>(context, listen: false);

    return TextField(
      onChanged: (value) {
        model.setEmail(value);
      },
      decoration: InputDecoration(
        prefix: const Icon(
          Icons.email,
          color: Color.fromARGB(255, 234, 64, 7),
        ),
        labelText: 'Email / username',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SignInModel>(context, listen: false);

    return TextField(
      onChanged: (value) {
        model.setPassword(value);
      },
      decoration: InputDecoration(
        prefix: const Icon(
          Icons.lock,
          color: Color.fromARGB(255, 234, 64, 7),
        ),
        labelText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
