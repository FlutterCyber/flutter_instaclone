import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyUploadPage extends StatefulWidget {
  const MyUploadPage({Key? key}) : super(key: key);

  @override
  _MyUploadPageState createState() => _MyUploadPageState();
}

class _MyUploadPageState extends State<MyUploadPage> {
  var captionController = TextEditingController();
  File? _image;

  // gallerydan rasmlarni olish uchun
  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  // cameradan rasmlarni olish un
  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  // post chiqarish
  _uploadNewPost() {
    String caption = captionController.text.toString().trim();
    if (caption.isEmpty) return;
    if (_image == null) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Upload",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Billabong",
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _uploadNewPost();
            },
            icon: const Icon(
              Icons.post_add,
              color: Color.fromRGBO(245, 96, 64, 1),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width,
                  color: Colors.grey.withOpacity(0.4),
                  child: _image == null
                      ? const Center(
                          child: Icon(
                            Icons.add_a_photo,
                            size: 60,
                            color: Colors.grey,
                          ),
                        )
                      : Stack(
                          children: [
                            Image.file(
                              _image!,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              width: double.infinity,
                              color: Colors.black12,
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.highlight_remove),
                                    color: Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        _image == null;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: TextField(
                  controller: captionController,
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: "Caption",
                    hintStyle: TextStyle(fontSize: 17.0, color: Colors.black38),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //asking gallery or camera
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
