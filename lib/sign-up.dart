import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePasswordText = true;
  bool _obscureConfirmPasswordText = true;

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Confirm password';
    }
    if (value != passwordController.text) {
      return 'Both passwords must be the same';
    }
    return null;
  }

  String? _firstNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your first name';
    }
    return null;
  }

  String? _lastNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your last name';
    }
    return null;
  }

  var boldText1 = const TextStyle(
    color: Colors.black,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  var boldText2 = const TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  var opacityStyle1 = TextStyle(
    color: Colors.black.withOpacity(0.8),
  );

  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    height: 110,
                    child: Image.asset('assets/logo2.png'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Welcome to GymBud!',
                    style: boldText1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Please create to start your workout routine.',
                    style: opacityStyle1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Email',
                          ),
                          validator: _emailValidator,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: _obscurePasswordText,
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscurePasswordText =
                                      !_obscurePasswordText;
                                });
                              },
                              icon: Icon(
                                _obscurePasswordText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                          validator: _passwordValidator,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: _obscureConfirmPasswordText,
                          controller: cPasswordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Confirm Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureConfirmPasswordText =
                                      !_obscureConfirmPasswordText;
                                });
                              },
                              icon: Icon(
                                _obscureConfirmPasswordText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                          validator: _confirmPasswordValidator,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: firstNameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter First Name',
                                ),
                                validator: _firstNameValidator,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextFormField(
                                controller: lastNameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter Last Name',
                                ),
                                validator: _lastNameValidator,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () {
                            // Perform your form validation here
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, you can proceed with registration.
                              // Add your registration logic here.
                            }
                          },
                          child: const Text(
                            'REGISTER',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
