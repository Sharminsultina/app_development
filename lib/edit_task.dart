import 'package:flutter/material.dart';
import 'package:app_development/validation.dart';

class EditTaskUpdate extends StatefulWidget {
  late String title, description;
  late int index;
  late Function(int index, String title, String description) taskItemUpdate;
  EditTaskUpdate({super.key, required this.index ,required this.title, required this.description, required this.taskItemUpdate});


  @override
  State<EditTaskUpdate> createState() => _EditTaskUpdateState();
}

class _EditTaskUpdateState extends State<EditTaskUpdate> {
  late final TextEditingController _textFieldOneEDController = TextEditingController(text: widget.title);
  late final TextEditingController _textFieldTwoEDController = TextEditingController(text: widget.description);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 16),
          TextFormField(
            controller: _textFieldOneEDController,
            decoration: const InputDecoration(
                hintText: "Add Title",
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2),
                )
            ),
            validator: (String? value){
              return Validation.checkInputValidation(value, "Please add a title");
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _textFieldTwoEDController,
            decoration: const InputDecoration(
                hintText: "Add Description",
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2),
                )
            ),
            validator: (String? value){
              return Validation.checkInputValidation(value, "Please add a description");
            },
          ),
          const SizedBox(height: 8),
          ElevatedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  widget.taskItemUpdate(widget.index, _textFieldOneEDController.text, _textFieldTwoEDController.text);
                }
              },
              child: const Text("Edit Done")),
        ],
      ),
    );
  }
}