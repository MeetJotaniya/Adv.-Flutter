import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MaterialApp(home: ReadFile()));
}

class ReadFile extends StatefulWidget {
  const ReadFile({super.key});

  @override
  State<ReadFile> createState() => _ReadFileState();
}

class _ReadFileState extends State<ReadFile> {
  final TextEditingController _controller = TextEditingController();
  String _fileContent = "No data yet";

  Future<String?> getPath() async {
    final Directory? dir = await getExternalStorageDirectory();
    return dir?.path;
  }

  Future<void> writeFile(String data) async {
    final String? path = await getPath();
    if (path == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("External path is null")));
      return;
    }

    final File file = File("$path/test.txt");
    try {
      await file.writeAsString(data);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Data written to: ${file.path}")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error writing file: $e")),
      );
    }
  }

  Future<void> readFile() async {
    final String? path = await getPath();
    if (path == null) {
      setState(() => _fileContent = "Path is null");
      return;
    }

    final File file = File("$path/test.txt");
    try {
      if (await file.exists()) {
        final String contents = await file.readAsString();
        setState(() => _fileContent = contents);
      } else {
        setState(() => _fileContent = "File does not exist: ${file.path}");
      }
    } catch (e) {
      setState(() => _fileContent = "Error reading file: $e");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Read From External"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _controller, decoration: const InputDecoration(labelText: "Enter text to write")),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => writeFile(_controller.text),
                  child: const Text("Write File"),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: readFile,
                  child: const Text("Read File"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text("File content:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_fileContent),
              ),
            )
          ],
        ),
      ),
    );
  }
}
