import 'package:bytebank/database/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class NewContact extends StatefulWidget {
  const NewContact({Key? key}) : super(key: key);

  @override
  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();

  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Full name"),
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _accountController,
              decoration: const InputDecoration(labelText: "Account number"),
              style: const TextStyle(fontSize: 24),
              keyboardType: const TextInputType.numberWithOptions(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final String name = _nameController.text;
                    final int? numberAccount =
                        int.tryParse(_accountController.text);
                    final Contact newContact = Contact(0, name, numberAccount!);
                    _dao.save(newContact).then((id) => Navigator.pop(context));
                  },
                  child: const Text("create"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
