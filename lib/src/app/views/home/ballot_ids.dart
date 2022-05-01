import 'package:deso_tss/src/app/providers/ballot_id_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _formKey = GlobalKey<FormState>();
final _textController = TextEditingController();

class BallotIDS extends StatelessWidget {
  const BallotIDS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ids = context.watch<BallotIDProvider>().ballotIDs;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: ListTile(
                  title: Text(
                    ids[index],
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      context
                          .read<BallotIDProvider>()
                          .deleteBallotID(ids[index]);
                      // id deleted snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Ballot ID deleted',
                              style: Theme.of(context).textTheme.subtitle1!),
                          backgroundColor: Colors.red,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
            itemCount: ids.length,
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          // open dialog with input form field
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              actionsPadding: const EdgeInsets.symmetric(horizontal: 18.0),
              title: Text(
                'Add new ballot id',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              content: Form(
                key: _formKey,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: Theme.of(context).textTheme.headline5,
                  controller: _textController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid ballot id';
                    }
                    if (value.length != 8) {
                      return 'Please enter 8 digit number';
                    }
                    if (ids.contains(value)) {
                      return 'Ballot id already exists';
                    }
                    return null;
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // save ballot id
                      final id = _textController.text;
                      _textController.clear();
                      context.read<BallotIDProvider>().addBallotID(id);
                      Navigator.of(context).pop();
                      // success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Ballot id added successfully',
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
          Icons.add,
          color: Colors.white,
          size: 35.0,
        ),
      ),
    );
  }
}
