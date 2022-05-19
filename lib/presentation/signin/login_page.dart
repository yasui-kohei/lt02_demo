import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lt02_demo/exception/validator/multi_validators.dart';
import 'package:lt02_demo/presentation/signin/signin_model.dart';

/// ログインの画面ページ
class LoginPage extends ConsumerWidget {
  LoginPage({Key? key}) : super(key: key);

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
                                child: Text('LT会へログイン'),
                              ),
                              BootstrapFormGroup(
                                children: [
                                  TextFormField(
                                    controller: signinState.emailController,
                                    validator: emailValidator,
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
                                          //Todo ViewModelのパスワード状態可視状態変更
                                          signinState.togglePasswordObscure();
                                        },
                                        child: Icon(Icons.remove_red_eye),
                                      ),
                                    ),
                                    onEditingComplete: () async {
                                      //Todo viewModelのログイン処理を行う。
                                      //await
                                    },
                                  ),
                                ],
                              ),
                              BootstrapParagraphs(
                                child: BootstrapButton(
                                  type: BootstrapButtonType.primary,
                                  size: BootstrapButtonSize.large,
                                  child: Text('ログイン'),
                                  onPressed: () async {
                                    final validate = _formKey.currentState!.validate();
                                    if(validate) {
                                      try {
                                        await signinState.login();
                                        context.goNamed('Home');
                                      } on Exception catch (e, st) {
                                        print(e);
                                        print(st);
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
