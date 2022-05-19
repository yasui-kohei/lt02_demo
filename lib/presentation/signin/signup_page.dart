import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lt02_demo/exception/validator/multi_validators.dart';
import 'package:lt02_demo/presentation/signin/signin_model.dart';

/// サインインの画面ページ
class SignupPage extends ConsumerWidget {
  SignupPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Signinページの状態を監視
    final signinState = ref.watch(signinProvider);
    return Stack(
      children: [
        BootstrapContainer(
          fluid: true,
          children: [
            BootstrapRow(
              height: 0,
              children: [
                BootstrapCol(
                  sizes: 'col-md-12 col-xl-6',
                  offsets: 'offset-md-0 offset-xl-3',
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: BootstrapPanel(
                      header: const BootstrapHeading.h4(
                        child: Text('LT会 Demoアプリ'),
                        marginTop: 5,
                        marginBottom: 5,
                      ),
                      body: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const BootstrapHeading.h5(
                              child: Text('LT会に登録'),
                            ),
                            BootstrapFormGroup(
                              children: [
                                TextFormField(
                                  controller: signinState.nameController,
                                  validator: (value) {
                                    if(value == null || value.isEmpty) {
                                      return '値が空です。';
                                    }
                                    return null;
                                  },
                                  decoration: BootstrapInputDecoration(
                                    hintText: 'name',
                                  ),
                                ),
                              ],
                            ),
                            BootstrapFormGroup(
                              children: [
                                TextFormField(
                                  validator: emailValidator,
                                  controller: signinState.emailController,
                                  decoration: BootstrapInputDecoration(
                                    hintText: 'email',
                                  ),
                                ),
                              ],
                            ),
                            BootstrapFormGroup(
                              children: [
                                TextFormField(
                                  controller: signinState.passwordController,
                                  validator: passwordValidator,
                                  obscureText: signinState.passwordObscure,
                                  decoration: BootstrapInputDecoration(
                                    hintText: 'password',
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        signinState.togglePasswordObscure();
                                      },
                                      child: Icon(Icons.remove_red_eye),
                                    ),
                                  ),
                                  onEditingComplete: () async {
                                  },
                                ),
                              ],
                            ),
                            BootstrapParagraphs(
                              child: BootstrapButton(
                                type: BootstrapButtonType.primary,
                                size: BootstrapButtonSize.large,
                                child: Text('登録'),
                                onPressed: () async {
                                  final validate = _formKey.currentState!.validate();
                                  if (validate) {
                                    try {
                                      await signinState.signupWithEmail();
                                      context.goNamed('home');
                                    } on Exception catch (e) {
                                      print(e);
                                    } on Error catch (e) {
                                      print(e);
                                    }
                                  } else {

                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
