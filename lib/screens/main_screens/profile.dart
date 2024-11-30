import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  TextEditingController _notesController = TextEditingController();
  bool _isEditable = false;
  bool _isSaved = false; // Track if the profile has been saved
  File? _profileImage;
  File? _coverImage;

  Future<void> _checkPermissions() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    var cameraStatus = await Permission.camera.status;
    if (!cameraStatus.isGranted) {
      await Permission.camera.request();
    }
  }

  Future<void> _pickImage(String imageType) async {
    await _checkPermissions(); // Ensure permissions are granted
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (imageType == "profile") {
          _profileImage = File(pickedFile.path);
        } else if (imageType == "cover") {
          _coverImage = File(pickedFile.path);
        }
      });
    }
  }

  void _showImageOptions(String imageType) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Upload New Photo"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(imageType);
                },
              ),
              if (imageType == "profile" && _profileImage != null)
                ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text("Remove Profile Photo"),
                  onTap: () {
                    setState(() {
                      _profileImage = null;
                    });
                    Navigator.pop(context);
                  },
                ),
              if (imageType == "cover" && _coverImage != null)
                ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text("Remove Cover Photo"),
                  onTap: () {
                    setState(() {
                      _coverImage = null;
                    });
                    Navigator.pop(context);
                  },
                ),
              ListTile(
                leading: const Icon(Icons.cancel),
                title: const Text("Cancel"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = "Coco Martin"; // Default name
    _bioController.text = "This is your bio. Edit it as you like.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 8),
            const Text(
              'Smart Swap',
              style: TextStyle(
                fontFamily: 'YesevaOne',
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(_isEditable ? Icons.check : Icons.edit),
            onPressed: () {
              setState(() {
                _isEditable = !_isEditable;
                if (!_isEditable) {
                  _isSaved = true; // Mark as saved when exiting edit mode
                }
              });
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFEEEEEE),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  GestureDetector(
                    onTap: _isEditable ? () => _showImageOptions("cover") : null,
                    child: _coverImage != null
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        _coverImage!,
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    )
                        : Container(
                      width: double.infinity,
                      height: 150,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  GestureDetector(
                    onTap: _isEditable ? () => _showImageOptions("profile") : null,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : const AssetImage("assets/profile.jpg")
                      as ImageProvider,
                      backgroundColor: Colors.grey.shade200,
                      child: _profileImage == null && _isEditable
                          ? const Icon(Icons.camera_alt, size: 30, color: Colors.grey)
                          : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Name section
              Text(
                _isSaved ? _nameController.text : _nameController.text,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: _isSaved ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "cocomartin@example.com", // Non-editable email
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: _isSaved ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              const SizedBox(height: 20),
              // Bio section
              Text(
                _isSaved ? _bioController.text : _bioController.text,
                style: TextStyle(
                  fontWeight: _isSaved ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              const SizedBox(height: 20),
              // Enhanced Notes Section
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _notesController,
                  enabled: _isEditable,
                  style: TextStyle(fontWeight: _isEditable ? FontWeight.bold : FontWeight.normal),
                  decoration: InputDecoration(
                    labelText: 'Notes',
                    border: InputBorder.none,
                    hintText: "Add your notes here...",
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                  ),
                  maxLines: 5,
                ),
              ),
              const SizedBox(height: 30),
              // Save button
              if (_isEditable)
                ElevatedButton(
                  onPressed: () {
                    _saveProfile();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Save Changes", style: TextStyle(fontSize: 16)),
                ),
              const SizedBox(height: 30),
              const Divider(thickness: 1),
              // Logout button
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text("Log Out"),
                onTap: () {
                  _showLogoutConfirmation(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveProfile() {
    setState(() {
      _isEditable = false;
      _isSaved = true; // Mark as saved
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile saved successfully!")),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Log Out"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text("Log Out"),
            ),
          ],
        );
      },
    );
  }
}
