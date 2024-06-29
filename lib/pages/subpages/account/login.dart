// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'create.dart';

class AccountAccountLogInPageLARGE extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final MainAxisAlignment align;
  final VoidCallback onSubmit;
  final VoidCallback onNewUser;
  bool showPassword;

  AccountAccountLogInPageLARGE(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.onSubmit,
      required this.onNewUser,
      required this.align,
      required this.showPassword});

  @override
  State<AccountAccountLogInPageLARGE> createState() =>
      _AccountAccountLogInPageLARGEState();
}

class AccountAccountLogInPageSMALL extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final MainAxisAlignment align;
  final VoidCallback onSubmit;
  final VoidCallback onNewUser;
  bool showPassword;

  AccountAccountLogInPageSMALL(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.onSubmit,
      required this.onNewUser,
      required this.align,
      required this.showPassword});

  @override
  State<AccountAccountLogInPageSMALL> createState() =>
      _AccountAccountLogInPageSMALLState();
}

// LOGIN logic and system
class AccountLogInPage extends StatefulWidget {
  const AccountLogInPage({
    super.key,
  });

  @override
  State<AccountLogInPage> createState() => _AccountLogInPageState();
}

class _AccountAccountLogInPageLARGEState
    extends State<AccountAccountLogInPageLARGE> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: widget.align,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.menu_book_rounded,
                    size: 50,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Accedi",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Utilizza il tuo Account MyBookshelf",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: widget.emailController,
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Indirizzo email',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: widget.passwordController,
                    obscureText: widget.showPassword,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.showPassword = !widget.showPassword;
                              });
                            },
                            icon: Icon(widget.showPassword == true
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded))),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: widget.onNewUser,
                          child: const Text("Crea un account")),
                      const SizedBox(
                        width: 8,
                      ),
                      FilledButton(
                          onPressed: widget.onSubmit,
                          child: const Text("Entra")),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AccountAccountLogInPageSMALLState
    extends State<AccountAccountLogInPageSMALL> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu_book_rounded,
              size: 50,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Accedi",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Utilizza il tuo Account MyBookshelf",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 32,
            ),
            TextField(
              controller: widget.emailController,
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Indirizzo email',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: widget.passwordController,
              obscureText: widget.showPassword,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.showPassword = !widget.showPassword;
                        });
                      },
                      icon: Icon(widget.showPassword == true
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded))),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: widget.onNewUser,
                    child: const Text("Crea un account")),
                const SizedBox(
                  width: 8,
                ),
                FilledButton(
                    onPressed: widget.onSubmit, child: const Text("Entra")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _AccountLogInPageState extends State<AccountLogInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          MediaQuery.of(context).size.width > 840
              ? Center(
                  child: SizedBox(
                    height: 350,
                    width: 840,
                    child: Card.filled(
                      child: AccountAccountLogInPageLARGE(
                        emailController: emailController,
                        passwordController: passwordController,
                        onNewUser: createAccount,
                        onSubmit: signUserIn,
                        align: MainAxisAlignment.start,
                        showPassword: showPassword,
                      ),
                    ),
                  ),
                )
              : MediaQuery.of(context).size.width > 600
                  ? AccountAccountLogInPageLARGE(
                      emailController: emailController,
                      passwordController: passwordController,
                      onNewUser: createAccount,
                      onSubmit: signUserIn,
                      align: MainAxisAlignment.center,
                      showPassword: showPassword,
                    )
                  : AccountAccountLogInPageSMALL(
                      emailController: emailController,
                      passwordController: passwordController,
                      onNewUser: createAccount,
                      onSubmit: signUserIn,
                      align: MainAxisAlignment.start,
                      showPassword: showPassword,
                    )
        ],
      ),
    ));
  }

  void createAccount() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AccountCreatePage()));
  }

  // wrong email message popup
  void errorMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text(
            'Errore:',
          ),
          icon: Icon(Icons.error_rounded),
          content: Text("L'email o la password sono errate"),
        );
      },
    );
  }

  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // pop the loading circle
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException {
      // pop the loading circle
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // WRONG EMAIL or PASSWORD
      errorMessage();
    }
  }
}
