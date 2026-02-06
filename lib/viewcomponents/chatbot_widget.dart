import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../models/chat_message_model.dart';
import '../utilities/chatbot_service.dart';
import '../utilities/url_helper.dart';
import '../core/constants/app_constants.dart';

class ChatbotWidget extends StatefulWidget {
  const ChatbotWidget({super.key});

  @override
  State<ChatbotWidget> createState() => _ChatbotWidgetState();
}

class _ChatbotWidgetState extends State<ChatbotWidget> {
  bool isOpen = false;
  bool showCallbackForm = false;
  final List<ChatMessage> messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  
  // Callback form controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Welcome message
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          messages.add(ChatMessage(
            message: "Hello! I'm here to help you learn more about ${AppConstants.name} and answer your questions about hiring and collaboration.",
            isUser: false,
            timestamp: DateTime.now(),
          ));
        });
      }
    });
  }

  void _clearChat() {
    setState(() {
      messages.clear();
      messages.add(ChatMessage(
        message: "Chat history cleared. How can I help you?",
        isUser: false,
        timestamp: DateTime.now(),
      ));
    });
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      messages.add(ChatMessage(
        message: text,
        isUser: true,
        timestamp: DateTime.now(),
      ));
    });

    _controller.clear();
    _scrollToBottom();

    // Get bot response
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() {
          messages.add(ChatMessage(
            message: ChatbotService.getResponse(text),
            isUser: false,
            timestamp: DateTime.now(),
          ));
        });
        _scrollToBottom();
      }
    });
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _submitCallbackRequest() {
    if (_nameController.text.isEmpty || 
        _emailController.text.isEmpty || 
        _phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }

    // Validate email format
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(_emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address')),
      );
      return;
    }

    final emailBody = Uri.encodeComponent(
      'Callback Request\n\n'
      'Name: ${_nameController.text}\n'
      'Email: ${_emailController.text}\n'
      'Phone: ${_phoneController.text}\n'
      'Message: ${_messageController.text}\n\n'
      'Please call me back at your earliest convenience.'
    );

    UrlHelper.launchURL(
      'mailto:${AppConstants.email}?subject=Callback Request from ${_nameController.text}&body=$emailBody'
    );

    setState(() {
      showCallbackForm = false;
      _nameController.clear();
      _emailController.clear();
      _phoneController.clear();
      _messageController.clear();
      messages.add(ChatMessage(
        message: "Callback request submitted successfully. I will contact you within 24 hours at ${_emailController.text}",
        isUser: false,
        timestamp: DateTime.now(),
      ));
    });
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (isOpen)
            SlideInRight(
              duration: const Duration(milliseconds: 300),
              child: Container(
                width: 400,
                height: 600,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFF112240).withValues(alpha: 0.98),
                      const Color(0xFF1A2F4F).withValues(alpha: 0.95),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: const Color(0xFF64FFDA).withValues(alpha: 0.3),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF64FFDA).withValues(alpha: 0.3),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildHeader(),
                    if (showCallbackForm)
                      Expanded(child: _buildCallbackForm())
                    else ...[
                      Expanded(child: _buildMessagesList()),
                      if (messages.length <= 2) _buildQuickReplies(),
                      _buildActionButtons(),
                      _buildInput(),
                    ],
                  ],
                ),
              ),
            ),
          _buildFloatingButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF64FFDA), Color(0xFF00D9A5)],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(23),
          topRight: Radius.circular(23),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF0A192F),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Icon(
              Icons.support_agent_rounded,
              color: Color(0xFF64FFDA),
              size: 24,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  showCallbackForm ? "Request Callback" : "Virtual Assistant",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0A192F),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFF0A192F),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "Available 24/7",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: const Color(0xFF0A192F),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (showCallbackForm)
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF0A192F)),
              onPressed: () => setState(() => showCallbackForm = false),
            ),
          IconButton(
            icon: const Icon(Icons.close, color: Color(0xFF0A192F)),
            onPressed: () => setState(() => isOpen = false),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesList() {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(20),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return _buildMessageBubble(message);
      },
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment:
            message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isUser) ...[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF64FFDA), Color(0xFF00D9A5)],
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.support_agent_rounded,
                color: Color(0xFF0A192F),
                size: 20,
              ),
            ),
            const SizedBox(width: 10),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                gradient: message.isUser
                    ? const LinearGradient(
                        colors: [Color(0xFF64FFDA), Color(0xFF00D9A5)],
                      )
                    : LinearGradient(
                        colors: [
                          const Color(0xFF233554).withValues(alpha: 0.6),
                          const Color(0xFF1A2F4F).withValues(alpha: 0.4),
                        ],
                      ),
                borderRadius: BorderRadius.circular(15),
                border: message.isUser
                    ? null
                    : Border.all(
                        color: const Color(0xFF64FFDA).withValues(alpha: 0.2),
                      ),
              ),
              child: Text(
                message.message,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  height: 1.6,
                  color: message.isUser
                      ? const Color(0xFF0A192F)
                      : const Color(0xFFCCD6F6),
                ),
              ),
            ),
          ),
          if (message.isUser) ...[
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF233554),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF64FFDA).withValues(alpha: 0.3),
                ),
              ),
              child: const Icon(
                Icons.person,
                color: Color(0xFF64FFDA),
                size: 20,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildQuickReplies() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quick questions:",
            style: GoogleFonts.inter(
              fontSize: 12,
              color: const Color(0xFF8892B0),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: ChatbotService.getQuickReplies()
                .map((reply) => GestureDetector(
                      onTap: () => _sendMessage(reply),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF233554).withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color(0xFF64FFDA).withValues(alpha: 0.3),
                          ),
                        ),
                        child: Text(
                          reply,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: const Color(0xFF64FFDA),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: _buildActionButton(
              "Request Callback",
              Icons.phone_callback,
              () => setState(() => showCallbackForm = true),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _buildActionButton(
              "Download Resume",
              Icons.download,
              () => UrlHelper.launchURL(AppConstants.cvUrl),
            ),
          ),
          const SizedBox(width: 10),
          _buildIconButton(
            Icons.delete_outline,
            _clearChat,
            "Clear Chat",
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF233554).withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xFF64FFDA).withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFF64FFDA), size: 16),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 11,
                color: const Color(0xFF64FFDA),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onTap, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF233554).withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFF64FFDA).withValues(alpha: 0.3),
            ),
          ),
          child: Icon(icon, color: const Color(0xFF64FFDA), size: 18),
        ),
      ),
    );
  }

  Widget _buildCallbackForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Request a Callback",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFCCD6F6),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Fill in your details and I'll get back to you within 24 hours.",
            style: GoogleFonts.inter(
              fontSize: 14,
              color: const Color(0xFF8892B0),
            ),
          ),
          const SizedBox(height: 25),
          _buildFormField("Your Name *", _nameController, Icons.person),
          const SizedBox(height: 15),
          _buildFormField("Email Address *", _emailController, Icons.email),
          const SizedBox(height: 15),
          _buildFormField("Phone Number *", _phoneController, Icons.phone),
          const SizedBox(height: 15),
          _buildFormField(
            "Message (Optional)",
            _messageController,
            Icons.message,
            maxLines: 4,
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitCallbackRequest,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF64FFDA),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Submit Request",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF0A192F),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField(
    String label,
    TextEditingController controller,
    IconData icon, {
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: GoogleFonts.inter(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.inter(color: const Color(0xFF8892B0)),
        prefixIcon: Icon(icon, color: const Color(0xFF64FFDA), size: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: const Color(0xFF64FFDA).withValues(alpha: 0.3),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: const Color(0xFF64FFDA).withValues(alpha: 0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFF64FFDA),
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget _buildInput() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF0A192F).withValues(alpha: 0.5),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(23),
          bottomRight: Radius.circular(23),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: GoogleFonts.inter(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Type your message...",
                hintStyle: GoogleFonts.inter(
                  color: const Color(0xFF8892B0),
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: const Color(0xFF64FFDA).withValues(alpha: 0.3),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: const Color(0xFF64FFDA).withValues(alpha: 0.3),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    color: Color(0xFF64FFDA),
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              onSubmitted: _sendMessage,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF64FFDA), Color(0xFF00D9A5)],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF64FFDA).withValues(alpha: 0.4),
                  blurRadius: 15,
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.send_rounded, color: Color(0xFF0A192F)),
              onPressed: () => _sendMessage(_controller.text),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingButton() {
    return BounceInUp(
      duration: const Duration(milliseconds: 800),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => setState(() => isOpen = !isOpen),
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF64FFDA), Color(0xFF00D9A5)],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF64FFDA).withValues(alpha: 0.5),
                  blurRadius: 25,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  isOpen ? Icons.close_rounded : Icons.chat_rounded,
                  color: const Color(0xFF0A192F),
                  size: 32,
                ),
                if (!isOpen && messages.length == 1)
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF0A192F), width: 2),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
