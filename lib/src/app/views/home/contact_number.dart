import 'package:deso_tss/src/app/providers/ballot_id_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _formKey = GlobalKey<FormState>();
final _textController = TextEditingController();

class ContactNumber extends StatelessWidget {
  const ContactNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      InkWell(
        onTap: () {
          // open dialog with input form field with cancel save button
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              actionsPadding: const EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
              title: Text(
                'Override contact number',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              // input form field
              content: Form(
                key: _formKey,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _textController,
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  style: Theme.of(context).textTheme.headline5,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a contact number';
                    }
                    return null;
                  },
                ),
              ),
              actions: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Save'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Provider.of<BallotIDProvider>(context, listen: false)
                          .setContact(_textController.text);
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Contact number successfully override',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        },
        child: const Icon(
          Icons.info_outline,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        width: 5.0,
      ),
      Text(
        'SEND TO: ${context.watch<BallotIDProvider>().selectedContact ?? 'Select contact'}',
        style: Theme.of(context)
            .textTheme
            .subtitle2!
            .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ]);
  }
}
