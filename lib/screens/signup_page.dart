import 'package:flutter/material.dart';



// ============ SIGN UP PAGE ============
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int _currentStep = 0;

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _nativePlaceController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _familyNameController = TextEditingController();
  final TextEditingController _familyMobileController = TextEditingController();
  final TextEditingController _friendNameController = TextEditingController();
  final TextEditingController _friendMobileController = TextEditingController();
  final TextEditingController _healthConditionController =
      TextEditingController();
  final TextEditingController _medicationsController = TextEditingController();
  final TextEditingController _bloodGroupController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _otpSent = false;
  bool _mobileVerified = false;
  bool _locationPermission = false;
  bool _notificationPermission = false;
  bool _smsPermission = false;
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    _mobileController.dispose();
    _otpController.dispose();
    _nativePlaceController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _familyNameController.dispose();
    _familyMobileController.dispose();
    _friendNameController.dispose();
    _friendMobileController.dispose();
    _healthConditionController.dispose();
    _medicationsController.dispose();
    _bloodGroupController.dispose();
    super.dispose();
  }

  void _sendOTP() {
    if (_mobileController.text.length == 10) {
      setState(() {
        _otpSent = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('OTP sent successfully! ✓'),
          backgroundColor: Color(0xFF4ECDC4),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter valid 10-digit mobile number'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _verifyOTP() {
    if (_otpController.text.length == 6) {
      setState(() {
        _mobileVerified = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mobile verified successfully! ✓'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter valid 6-digit OTP'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _nextStep() {
    if (_validateCurrentStep()) {
      if (_currentStep < 3) {
        setState(() {
          _currentStep++;
        });
      } else {
        _handleSignUp();
      }
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  bool _validateCurrentStep() {
    switch (_currentStep) {
      case 0:
        if (_nameController.text.isEmpty) {
          _showError('Please enter your name');
          return false;
        }
        if (_emailController.text.isEmpty ||
            !_emailController.text.contains('@')) {
          _showError('Please enter valid gmail');
          return false;
        }
        if (_ageController.text.isEmpty) {
          _showError('Please enter your age');
          return false;
        }
        if (_nativePlaceController.text.isEmpty) {
          _showError('Please enter native place');
          return false;
        }
        return true;

      case 1:
        if (!_mobileVerified) {
          _showError('Please verify mobile number');
          return false;
        }
        if (_passwordController.text.length < 6) {
          _showError('Password must be 6+ characters');
          return false;
        }
        if (_passwordController.text != _confirmPasswordController.text) {
          _showError('Passwords do not match');
          return false;
        }
        return true;

      case 2:
        if (_familyNameController.text.isEmpty ||
            _familyMobileController.text.isEmpty) {
          _showError('Add family emergency contact');
          return false;
        }
        if (_friendNameController.text.isEmpty ||
            _friendMobileController.text.isEmpty) {
          _showError('Add friend emergency contact');
          return false;
        }
        return true;

      case 3:
        if (!_locationPermission ||
            !_notificationPermission ||
            !_smsPermission) {
          _showError('Grant all permissions');
          return false;
        }
        if (!_agreeToTerms) {
          _showError('Accept terms & conditions');
          return false;
        }
        return true;

      default:
        return true;
    }
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.red));
  }

  void _handleSignUp() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Account created successfully! 🎉'),
        backgroundColor: Colors.green,
      ),
    );
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF6B4CE6).withOpacity(0.1),
              const Color(0xFFFF6B9D).withOpacity(0.1),
              const Color(0xFF4ECDC4).withOpacity(0.1),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF6B4CE6),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6B4CE6),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: List.generate(4, (index) {
                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 4,
                        decoration: BoxDecoration(
                          color: index <= _currentStep
                              ? const Color(0xFF6B4CE6)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                _getStepTitle(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: _buildStepContent(),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    if (_currentStep > 0)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _previousStep,
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: const BorderSide(color: Color(0xFF6B4CE6)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Back',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6B4CE6),
                            ),
                          ),
                        ),
                      ),
                    if (_currentStep > 0) const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF6B4CE6), Color(0xFFFF6B9D)],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6B4CE6).withOpacity(0.4),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: _nextStep,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            _currentStep < 3 ? 'Next' : 'Create Account',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getStepTitle() {
    switch (_currentStep) {
      case 0:
        return 'Step 1: Basic Information';
      case 1:
        return 'Step 2: Mobile & Password';
      case 2:
        return 'Step 3: Emergency Contacts';
      case 3:
        return 'Step 4: Healthcare & Permissions';
      default:
        return '';
    }
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return _buildBasicInfoStep();
      case 1:
        return _buildMobileVerificationStep();
      case 2:
        return _buildEmergencyContactsStep();
      case 3:
        return _buildHealthcarePermissionsStep();
      default:
        return Container();
    }
  }

  Widget _buildBasicInfoStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTextField(
          controller: _nameController,
          label: 'Full Name',
          hint: 'Enter your full name',
          icon: Icons.person_outline,
        ),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _emailController,
          label: 'Gmail',
          hint: 'Enter your gmail',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _ageController,
          label: 'Age',
          hint: 'Enter your age',
          icon: Icons.cake_outlined,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _nativePlaceController,
          label: 'Native Place',
          hint: 'City, State, Country',
          icon: Icons.location_city_outlined,
        ),
      ],
    );
  }

  Widget _buildMobileVerificationStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: _buildTextField(
                controller: _mobileController,
                label: 'Mobile Number',
                hint: '10-digit number',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                enabled: !_mobileVerified,
              ),
            ),
            const SizedBox(width: 10),
            if (!_mobileVerified)
              ElevatedButton(
                onPressed: _sendOTP,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6B4CE6),
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(_otpSent ? 'Resend' : 'Send OTP'),
              ),
          ],
        ),

        if (_otpSent && !_mobileVerified) ...[
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  controller: _otpController,
                  label: 'Enter OTP',
                  hint: '6-digit OTP',
                  icon: Icons.lock_clock_outlined,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: _verifyOTP,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4ECDC4),
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Verify'),
              ),
            ],
          ),
        ],

        if (_mobileVerified) ...[
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green),
            ),
            child: const Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 10),
                Text(
                  'Mobile verified!',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],

        const SizedBox(height: 24),
        const Text(
          'Create Password',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B4CE6),
          ),
        ),
        const SizedBox(height: 16),

        _buildPasswordField(
          controller: _passwordController,
          label: 'Password',
          hint: 'Min 6 characters',
          isVisible: _isPasswordVisible,
          onToggle: () =>
              setState(() => _isPasswordVisible = !_isPasswordVisible),
        ),
        const SizedBox(height: 16),
        _buildPasswordField(
          controller: _confirmPasswordController,
          label: 'Confirm Password',
          hint: 'Re-enter password',
          isVisible: _isConfirmPasswordVisible,
          onToggle: () => setState(
            () => _isConfirmPasswordVisible = !_isConfirmPasswordVisible,
          ),
        ),
      ],
    );
  }

  Widget _buildEmergencyContactsStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Family Contact',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFF6B9D),
          ),
        ),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _familyNameController,
          label: 'Family Member Name',
          hint: 'Full name',
          icon: Icons.family_restroom_outlined,
        ),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _familyMobileController,
          label: 'Family Mobile Number',
          hint: '10-digit number',
          icon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
        ),

        const SizedBox(height: 30),
        const Text(
          'Friend Contact',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFF6B9D),
          ),
        ),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _friendNameController,
          label: 'Friend Name',
          hint: 'Full name',
          icon: Icons.person_outline,
        ),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _friendMobileController,
          label: 'Friend Mobile Number',
          hint: '10-digit number',
          icon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }

  Widget _buildHealthcarePermissionsStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Health Information',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B4CE6),
          ),
        ),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _healthConditionController,
          label: 'Existing Health Conditions',
          hint: 'e.g. diabetes, asthma, none',
          icon: Icons.health_and_safety_outlined,
          maxLines: 2,
        ),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _medicationsController,
          label: 'Medications',
          hint: 'Regular medicines (if any)',
          icon: Icons.medication_outlined,
          maxLines: 2,
        ),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _bloodGroupController,
          label: 'Blood Group',
          hint: 'e.g. O+, A-, B+',
          icon: Icons.bloodtype_outlined,
        ),

        const SizedBox(height: 24),
        const Text(
          'Permissions',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B4CE6),
          ),
        ),
        const SizedBox(height: 8),
        _buildPermissionTile(
          title: 'Location Access',
          subtitle: 'Allow app to access your live location for safety alerts',
          value: _locationPermission,
          onChanged: (v) => setState(() => _locationPermission = v),
          icon: Icons.location_on_outlined,
        ),
        _buildPermissionTile(
          title: 'Notifications',
          subtitle: 'Receive safety alerts and trip updates',
          value: _notificationPermission,
          onChanged: (v) => setState(() => _notificationPermission = v),
          icon: Icons.notifications_active_outlined,
        ),
        _buildPermissionTile(
          title: 'SMS Access',
          subtitle: 'Allow app to send SOS messages to your contacts',
          value: _smsPermission,
          onChanged: (v) => setState(() => _smsPermission = v),
          icon: Icons.sms_outlined,
        ),

        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              value: _agreeToTerms,
              onChanged: (v) => setState(() => _agreeToTerms = v ?? false),
              activeColor: const Color(0xFF6B4CE6),
            ),
            const Expanded(
              child: Text(
                'I agree to the Terms & Conditions and consent to the use of my data for safety features.',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ====== REUSABLE WIDGET BUILDERS ======

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool enabled = true,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        enabled: enabled,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon, color: const Color(0xFF6B4CE6)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required bool isVisible,
    required VoidCallback onToggle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: !isVisible,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF6B4CE6)),
          suffixIcon: IconButton(
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: onToggle,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildPermissionTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: CheckboxListTile(
        value: value,
        onChanged: (v) => onChanged(v ?? false),
        activeColor: const Color(0xFF6B4CE6),
        title: Row(
          children: [
            Icon(icon, color: const Color(0xFF6B4CE6)),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }
}
