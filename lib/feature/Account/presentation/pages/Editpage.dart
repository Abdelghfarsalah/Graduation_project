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
      context
          .read<UpdateNameBloc>()
          .add(UpdateName(name: _nameController.text));
      // String updatedName = _nameController.text.trim();
      // Navigator.pop(context, updatedName);
    }
  }

  bool inAsyncCall = false;
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
          backgroundColor: const Color(0xFF008060), // soft green
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }, builder: (BuildContext context, state) {
      return ModalProgressHUD(
        progressIndicator: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.95,
          height: MediaQuery.sizeOf(context).height * 0.3,
          child: LoadingIndicator(
              indicatorType: Indicator.ballScaleMultiple,
              colors: const [
                Color(0xFFF5F5F5),
                Color(0xFF90CAF9),
                Color(0xFF64B5F6),
                Color(0xFF42A5F5),
                Color(0xFF1565C0),
              ],
              strokeWidth: 0,
              backgroundColor: Colors.transparent,
              pathBackgroundColor: Colors.transparent),
        ),
        inAsyncCall: inAsyncCall,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Edit Name',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: Colors.white,
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Your Name',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _nameController,
                          style: GoogleFonts.poppins(),
                          decoration: InputDecoration(
                            hintText: 'Enter your name',
                            hintStyle: GoogleFonts.poppins(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.grey[100],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              // borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              _saveName(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4A90E2),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Save',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
