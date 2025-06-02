import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class WaitlistForm extends StatefulWidget {
  const WaitlistForm({super.key});

  @override
  State<WaitlistForm> createState() => _WaitlistFormState();
}

class _WaitlistFormState extends State<WaitlistForm> {
  final TextEditingController _emailController = TextEditingController();
  bool _isSubmitting = false;
  bool _isSuccess = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    setState(() {
      _isSubmitting = true;
    });

    // Simulate network request
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isSubmitting = false;
      _isSuccess = true;
    });
    
    // Reset success state after some time
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isSuccess = false;
          _emailController.clear();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 800),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 500),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04), // Softer opacity
              blurRadius: 30, // More diffuse blur
              offset: const Offset(0, 8), // Slightly less offset
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Join the Waitlist',
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Be the first to know when we launch.',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 24),
            if (_isSuccess) ...[
              FadeIn(
                duration: const Duration(milliseconds: 500),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green.shade700),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Thanks for joining! We\'ll notify you when we launch.',
                          style: GoogleFonts.inter(
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ] else ...[
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: GoogleFonts.inter(color: Colors.black38),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _submitForm(),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: _isSubmitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          'Join Waitlist',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
