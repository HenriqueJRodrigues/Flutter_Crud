
import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    _formData['id'] = user.id;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatarUrl'] = user.avatarUrl;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final user = ModalRoute.of(context)!.settings.arguments as User?;
    if (user != null) {
      _loadFormData(user);
    }
  }


    @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuário'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final isValid = _form.currentState?.validate();
               if (isValid! && isValid) {
                  _form.currentState?.save();
                Provider.of<Users>(context, listen: false).put(
                  User(
                    id: _formData['id'].toString(),
                    name: _formData['name'].toString(),
                    email: _formData['email'].toString(),
                    avatarUrl: _formData['avatarUrl'].toString(),
                  ),
                );
                Navigator.of(context).pop();
              }
                }
              ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome'),
                  initialValue: _formData['name'],
                  /*validator: (value) {
                  
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe o nome';
                  }
                  
                  if (value.trim().length < 3) {
                    return 'Nome muito pequeno.';
                  }
                  
                  return null;
                },
                */
                  onSaved: (value) => _formData['name'] = value.toString(),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'E-mail'),
                  initialValue: _formData['email'],
                  onSaved: (value) => _formData['email'] = value.toString(),
                  // adicionar regras
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'URL do Avatar'),
                  initialValue: _formData['avatarUrl'],
                  onSaved: (value) => _formData['avatarUrl'] = value.toString(),
                  // adicionar regras
                )
              ],
            )),
      ),
    );
  }
}
