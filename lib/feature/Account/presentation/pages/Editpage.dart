import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/feature/Account/presentation/manager/update_avatar/update_avatar_bloc.dart';
import 'package:graduation_project/feature/Account/presentation/manager/update_avatar/update_avatar_state.dart';
import 'package:graduation_project/feature/Account/presentation/manager/update_name/update_name_bloc.dart';
import 'package:graduation_project/feature/Account/presentation/manager/update_name/update_name_event.dart';
import 'package:graduation_project/feature/Account/presentation/manager/update_name/update_name_state.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/avatarImageinAccount.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditPage extends StatefulWidget {
  final String initialName;

  const EditPage({Key? key, required this.initialName}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
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

  String Name = "";
  void _saveName(BuildContext context) {
    if (_formKey.currentState!.validate() && Name != _nameController.text) {
      FocusScope.of(context).unfocus(); // Dismiss keyboard
      context
          .read<UpdateNameBloc>()
          .add(UpdateName(name: _nameController.text));
    } else if (Name == _nameController.text) {
      Fluttertoast.showToast(
        msg: "Please change the name",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red, // Green color
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Name = widget.initialName;
    return BlocConsumer<UpdateAvatarBloc, UpdateAvatarStates>(
      listener: (context, state) {
        if (state is UpdateAvatarLoading) {
          inAsyncCall = true;
        } else {
          inAsyncCall = false;
        }
      },
      builder: (context, state) {
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
              Name = _nameController.text;
              // Navigator.pop(context, _nameController.text.trim());
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
                        _buildHeaderSection('Update Your Profile Avatar',
                            'This avatar will be visible to other users in the app'),
                        Center(child: Avatarimageinaccount()),
                        const SizedBox(height: 24),
                        SizedBox(height: 24.h),
                        Divider(color: Colors.grey[300], height: 1),
                        SizedBox(height: 24.h),
                        const SizedBox(height: 24),
                        _buildHeaderSection('Update Your Profile Name',
                            'This name will be visible to other users in the app'),
                        const SizedBox(height: 32),
                        _buildNameForm(),
                        const SizedBox(height: 24),
                        _buildSaveButton(ontap: () => _saveName(context)),
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
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon:
            const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Edit Profile ',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: Colors.black87,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildHeaderSection(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
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
                cursorColor: appColor.Primarycolor,
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

  Widget _buildSaveButton({required void Function()? ontap}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: ontap,
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
          'Save Name',
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
