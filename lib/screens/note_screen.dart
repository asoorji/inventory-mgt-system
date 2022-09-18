import 'package:flutter/material.dart';

import '../models/note_model.dart';
import '../services/database_helper.dart';

class NoteScreen extends StatelessWidget {
  final Note? note;

  const NoteScreen({Key? key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final locationController = TextEditingController();
    final sellingPriceController = TextEditingController();
    final costPriceController = TextEditingController();

    if (note != null) {
      titleController.text = note!.title;
      descriptionController.text = note!.description;
      locationController.text = note!.location;
      sellingPriceController.text = note!.sellingPrice;
      costPriceController.text = note!.costPrice;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(note == null ? 'New Product' : 'Edit Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            TextFormField(
              controller: titleController,
              maxLines: 1,
              decoration: const InputDecoration(
                  hintText: 'Product Name',
                  labelText: 'Name',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.75,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ))),
            ),
            TextFormField(
              controller: sellingPriceController,
              maxLines: 1,
              decoration: const InputDecoration(
                  hintText: 'Selling Price',
                  labelText: 'Selling Price',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.75,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ))),
            ),
            TextFormField(
              controller: costPriceController,
              maxLines: 1,
              decoration: const InputDecoration(
                  hintText: 'Cost Price',
                  labelText: 'Cost Price',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.75,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ))),
            ),
            TextFormField(
              controller: locationController,
              maxLines: 1,
              decoration: const InputDecoration(
                  hintText: 'Location',
                  labelText: 'Location',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.75,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ))),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                  hintText: 'Product Description',
                  labelText: 'Description',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.75,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ))),
              keyboardType: TextInputType.multiline,
              onChanged: (str) {},
              maxLines: 1,
            ),
            SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () async {
                    final title = titleController.value.text;
                    final sellingPrice = sellingPriceController.value.text;
                    if (title.isEmpty || sellingPrice.isEmpty) {
                      return;
                    }

                    final Note model = Note(
                        title: title,
                        sellingPrice: sellingPrice,
                        costPrice: 'costPrice',
                        id: note?.id,
                        description: 'description',
                        location: 'location');
                    if (note == null) {
                      await DatabaseHelper.addNote(model);
                    } else {
                      await DatabaseHelper.updateNote(model);
                    }

                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.white,
                                width: 0.75,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              )))),
                  child: Text(
                    note == null ? 'Save' : 'Edit',
                    style: const TextStyle(fontSize: 20),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
