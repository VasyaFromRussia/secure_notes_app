import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_notes/feature/auth/auth_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.pink,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Greeting'),
                  PasswordInputWidget(
                    controller: _controller,
                    onConfirmTap: BlocProvider.of<AuthCubit>(context).signUp,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.amber,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Greeting'),
                  PasswordInputWidget(
                    controller: _controller,
                    onConfirmTap: BlocProvider.of<AuthCubit>(context).signIn,
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class PasswordInputWidget extends StatefulWidget {
  const PasswordInputWidget({
    Key? key,
    required this.controller,
    required this.onConfirmTap,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String) onConfirmTap;

  @override
  _PasswordInputWidgetState createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  bool _isEnabled = false;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      final hasText = widget.controller.text.isNotEmpty;
      if (_isEnabled != hasText) {
        setState(() => _isEnabled = hasText);
      }
    });
  }

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 4),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
                  ),
                ),
              ),
            ),
            SendButton(
              isEnabled: _isEnabled,
              onTap: () => widget.onConfirmTap(widget.controller.text),
              radius: 8,
            ),
          ],
        ),
      );
}

class SendButton extends StatelessWidget {
  const SendButton({
    Key? key,
    required this.isEnabled,
    required this.onTap,
    required this.radius,
  }) : super(key: key);

  final bool isEnabled;
  final VoidCallback onTap;
  final double radius;

  BorderRadius get _borderRadius => BorderRadius.horizontal(right: Radius.circular(radius));

  @override
  Widget build(BuildContext context) => Material(
        color: isEnabled ? Theme.of(context).accentColor : Theme.of(context).disabledColor,
        borderRadius: _borderRadius,
        child: InkWell(
          onTap: isEnabled ? onTap : null,
          borderRadius: _borderRadius,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
}
