import 'package:adv_flutter_lab/Lab3/controller/database_controller.dart';
import 'package:adv_flutter_lab/Lab3/model/database_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: DatabaseView(),
    debugShowCheckedModeBanner: false,
  ));
}

class DatabaseView extends StatefulWidget {
  const DatabaseView({super.key});

  @override
  State<DatabaseView> createState() => _DatabaseViewState();
}

class _DatabaseViewState extends State<DatabaseView> {
  final DatabaseController _controller = DatabaseController();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _cityController = TextEditingController();
  String _selectedGender = 'Male';

  void _showForm(DatabaseModel? user) {
    if (user != null) {
      _nameController.text = user.name;
      _cityController.text = user.city;
      _selectedGender = user.gender;
    } else {
      _nameController.clear();
      _cityController.clear();
      _selectedGender = 'Male';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(user == null ? 'Add User' : 'Edit User'),
        content: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(labelText: 'City'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter city';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  items: ['Male', 'Female', 'Other']
                      .map((gender) => DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Gender'),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                if (user == null) {
                  await _controller.addUser(
                    DatabaseModel(
                      name: _nameController.text,
                      city: _cityController.text,
                      gender: _selectedGender,
                    ),
                  );
                } else {
                  await _controller.updateUser(
                    DatabaseModel(
                      uid: user.uid,
                      name: _nameController.text,
                      city: _cityController.text,
                      gender: _selectedGender,
                    ),
                  );
                }
                Navigator.pop(context);
                setState(() {});
              }
            },
            child: Text(user == null ? 'Add' : 'Update'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD with DB'),
      ),
      body: FutureBuilder<List<DatabaseModel>>(
        future: _controller.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(user.name),
                    subtitle: Text('${user.city} - ${user.gender}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _showForm(user),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            await _controller.deleteUser(user.uid!);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _cityController.dispose();
    super.dispose();
  }
}
