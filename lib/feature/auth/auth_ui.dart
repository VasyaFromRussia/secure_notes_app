import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_notes/feature/auth/auth_bloc.dart';
import 'package:secure_notes/feature/common/common_ui.dart';
import 'package:secure_notes/feature/resources/drawables.dart';
import 'package:secure_notes/feature/resources/strings.dart';
import 'package:secure_notes/utils/resources.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                Drawables.imageSignUp,
                width: imageSize,
                height: imageSize,
              ),
            ),
          ),
          CardContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Greeting(),
                SizedBox(height: 16),
                Text(AppStrings.signUpDescription, style: context.textTheme.bodyText1),
                SizedBox(height: 8),
                PasswordInputWidget(
                  controller: _controller,
                  onConfirmTap: BlocProvider.of<AuthCubit>(context).signUp,
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                Drawables.imageSignIn,
                width: imageSize,
                height: imageSize,
              ),
            ),
          ),
          CardContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Greeting(),
                SizedBox(height: 16),
                Text(AppStrings.signInDescription, style: context.textTheme.bodyText1),
                SizedBox(height: 8),
                PasswordInputWidget(
                  controller: _controller,
                  onConfirmTap: BlocProvider.of<AuthCubit>(context).signIn,
                ),
                SizedBox(height: 10),
                Center(
                  child: TextButton(
                    onPressed: BlocProvider.of<AuthCubit>(context).signOut,
                    child: Text(AppStrings.forgotPassword),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
                style: context.textTheme.headline6,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: AppStrings.passwordHint,
                  hintStyle: context.textTheme.headline6?.copyWith(color: context.theme.disabledColor),
                  contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  border: _buildBorder(context.theme.disabledColor),
                  enabledBorder: _buildBorder(context.theme.disabledColor),
                  focusedBorder: _buildBorder(context.theme.accentColor),
                ),
              ),
            ),
            ConfirmationButton(
              isEnabled: _isEnabled,
              onTap: () => widget.onConfirmTap(widget.controller.text),
              radius: 8,
            ),
          ],
        ),
      );

  InputBorder _buildBorder(Color color) => OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: color),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
      );
}

class ConfirmationButton extends StatelessWidget {
  const ConfirmationButton({
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
        color: isEnabled ? context.theme.accentColor : context.theme.disabledColor,
        borderRadius: _borderRadius,
        child: InkWell(
          onTap: isEnabled ? onTap : null,
          borderRadius: _borderRadius,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                child: Icon(
                  Icons.lock_open,
                  color: context.theme.backgroundColor,
                ),
              ),
            ),
          ),
        ),
      );
}

class Greeting extends StatelessWidget {
  const Greeting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(AppStrings.greeting, style: context.textTheme.headline5);
}
