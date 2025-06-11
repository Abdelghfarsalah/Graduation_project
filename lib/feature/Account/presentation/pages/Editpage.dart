import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/feature/Account/presentation/manager/update_name/update_name_bloc.dart';
import 'package:graduation_project/feature/Account/presentation/manager/update_name/update_name_event.dart';
import 'package:graduation_project/feature/Account/presentation/manager/update_name/update_name_state.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditNamePage extends StatefulWidget {
  final String initialName;

  const EditNamePage({Key? key, required this.initialName}) : super(key: key);

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  bool inAsyncCall = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _saveName(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus(); // Dismiss keyboard
      context
          .read<UpdateNameBloc>()
          .add(UpdateName(name: _nameController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateNameBloc, UpdateNameStatus>(
      listener: (context, state) {
        if (state is UpdateNameLoading) {
          inAsyncCall = true;
        } else {
          inAsyncCall = false;
        }
        if (state is UpdateNameSuccess) {
          Fluttertoast.showToast(
            msg: "Name updated successfully 🎉",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: const Color(0xFF4CAF50), // Green color
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.pop(context, _nameController.text.trim());
        } else if (state is UpdateNameFailure) {
          Fluttertoast.showToast(
            msg: "Failed to update name. Please try again.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      builder: (BuildContext context, state) {
        return ModalProgressHUD(
          progressIndicator: _buildLoadingIndicator(context),
          inAsyncCall: inAsyncCall,
          child: Scaffold(
            backgroundColor: Colors.grey[50],
            appBar: _buildAppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    _buildHeaderSection(),
                    const SizedBox(height: 32),
                    _buildNameForm(),
                    const SizedBox(height: 24),
                    _buildSaveButton(),
                    const SizedBox(height: 16),
                    _buildNameGuidelines(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoadingIndicator(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.95,
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: const LoadingIndicator(
        indicatorType: Indicator.ballScaleMultiple,
        colors: [
          Color(0xFFF5F5F5),
          Color(0xFF90CAF9),
          Color(0xFF64B5F6),
          Color(0xFF42A5F5),
          Color(0xFF1565C0),
        ],
        strokeWidth: 0,
        backgroundColor: Colors.transparent,
        pathBackgroundColor: Colors.transparent,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon:
            const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Edit Profile Name',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: Colors.black87,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Update Your Profile Name',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'This name will be visible to other users in the app',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildNameForm() {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black87,
                ),
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: GoogleFonts.poppins(color: Colors.grey[600]),
                  hintText: 'Enter your full name',
                  hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Colors.grey[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Color(0xFF4A90E2), width: 2),
                  ),
                  prefixIcon: const Icon(Icons.person_outline_rounded,
                      color: Colors.grey),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  if (value.trim().length < 3) {
                    return 'Name should be at least 3 characters';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _saveName(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4A90E2),
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          shadowColor: const Color(0xFF4A90E2).withOpacity(0.3),
        ),
        child: Text(
          'Save Changes',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildNameGuidelines() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.info_outline_rounded,
                  color: Color(0xFF4A90E2), size: 20),
              const SizedBox(width: 8),
              Text(
                'Name Guidelines',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[800],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '• Use your real name for better recognition\n'
            '• Avoid special characters or emojis\n'
            '• 3-50 characters recommended',
            style: GoogleFonts.poppins(
              color: Colors.blue[800],
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
