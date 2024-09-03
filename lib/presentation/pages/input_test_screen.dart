import 'package:flutter/material.dart';

class InputTestScreen extends StatefulWidget {
  const InputTestScreen({super.key});

  @override
  State<InputTestScreen> createState() => _InputTestScreenState();
}

class _InputTestScreenState extends State<InputTestScreen> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _lastnameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _companyFocusNode = FocusNode();
  final FocusNode _siretFocusNode = FocusNode();
  final FocusNode _codePostalFocusNode = FocusNode();
  final FocusNode _oneFocusNode = FocusNode();
  final FocusNode _twoFocusNode = FocusNode();
  final FocusNode _threeFocusNode = FocusNode();

  ///
  final TextEditingController _oneController = TextEditingController();
  final TextEditingController _twoController = TextEditingController();
  final TextEditingController _threeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _siretController = TextEditingController();
  final TextEditingController _codePostalController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_nameFocusNode);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameFocusNode.dispose();
    _lastnameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _companyFocusNode.dispose();
    _siretFocusNode.dispose();
    _codePostalFocusNode.dispose();
    _oneFocusNode.dispose();
    _twoFocusNode.dispose();
    _threeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('ENREGISTREMENT'),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    inputWidget(
                        focusNode: _nameFocusNode,
                        prefixIcon: Icons.person,
                        hintText: 'Entrer le nom',
                        controller: _nameController,
                        nextFocusNode: _lastnameFocusNode),
                    inputWidget(
                      focusNode: _lastnameFocusNode,
                      prefixIcon: Icons.person,
                      hintText: 'Entrer le prénom',
                      controller: _lastnameController,
                      nextFocusNode: _emailFocusNode,
                    ),
                    inputWidget(
                      focusNode: _emailFocusNode,
                      prefixIcon: Icons.email,
                      hintText: 'Entrer le mail',
                      controller: _emailController,
                      nextFocusNode: _phoneFocusNode,
                    ),
                    inputWidget(
                        focusNode: _phoneFocusNode,
                        prefixIcon: Icons.lock,
                        hintText: 'Entrer le numéro',
                        controller: _phoneController,
                        nextFocusNode: _companyFocusNode),
                    inputWidget(
                        focusNode: _companyFocusNode,
                        prefixIcon: Icons.lock,
                        hintText: 'Entrer le nom de la company',
                        controller: _companyController,
                        nextFocusNode: _siretFocusNode),
                    inputWidget(
                        focusNode: _siretFocusNode,
                        prefixIcon: Icons.lock,
                        hintText: 'Entrer le numéro de siret',
                        controller: _siretController,
                        nextFocusNode: _codePostalFocusNode),
                    inputWidget(
                        focusNode: _codePostalFocusNode,
                        prefixIcon: Icons.lock,
                        hintText: 'Entrer le code postal',
                        controller: _codePostalController,
                        nextFocusNode: _oneFocusNode),
                    inputWidget(
                        focusNode: _oneFocusNode,
                        prefixIcon: Icons.lock,
                        hintText: 'Entrer ONE',
                        controller: _oneController,
                        nextFocusNode: _twoFocusNode),
                    inputWidget(
                        focusNode: _twoFocusNode,
                        prefixIcon: Icons.lock,
                        hintText: 'Entrer TWO',
                        controller: _twoController,
                        nextFocusNode: _threeFocusNode),
                    inputWidget(
                        focusNode: _threeFocusNode,
                        prefixIcon: Icons.lock,
                        hintText: 'Entrer THREE',
                        controller: _threeController,
                        nextFocusNode: _passwordFocusNode),
                    inputWidget(
                        focusNode: _passwordFocusNode,
                        prefixIcon: Icons.lock,
                        hintText: 'Entrer le mot de passe',
                        controller: _passwordController,
                        nextFocusNode: _confirmPasswordFocusNode),
                    inputWidget(
                        focusNode: _confirmPasswordFocusNode,
                        prefixIcon: Icons.lock,
                        hintText: 'Confirmer le mot de passe',
                        controller: _confirmPasswordController,
                        nextFocusNode: null),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                      ),
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
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
    );
  }

  Widget inputWidget({
    required FocusNode focusNode,
    required IconData prefixIcon,
    required String hintText,
    required TextEditingController controller,
    FocusNode? nextFocusNode,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,

        ///autofocus: true,
        focusNode: focusNode,
        textInputAction:
            nextFocusNode != null ? TextInputAction.next : TextInputAction.done,
        onSubmitted: (_) {
          if (nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          } else {
            focusNode.unfocus();
          }
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            prefixIcon: Icon(
              prefixIcon,
              color: Colors.orangeAccent,
            ),
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.orangeAccent,
            ),
            hintText: hintText,
            helperStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            )),
        cursorColor: Colors.grey,
        cursorHeight: 25,
      ),
    );
  }
}
