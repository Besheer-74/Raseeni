import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raseeni/controller/chat_controller.dart';

import '../model/appStyle.dart';

class ViewChatScreen extends StatefulWidget {
  const ViewChatScreen({super.key});

  @override
  State<ViewChatScreen> createState() => _ViewChatScreenState();
}

class _ViewChatScreenState extends State<ViewChatScreen> {
  @override
  void initState() {
    super.initState();
    final chatProvider = Provider.of<ChatController>(context, listen: false);
    chatProvider.fetchMessages(); // Fetch messages when the screen initializes
  }

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatController>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            _buildAppBar(),

            // Chat Area
            Expanded(
              child: chatProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _buildChatList(chatProvider.messages),
            ),

            // Message Input
            MessageInputField(
              onSend: (message) {
                chatProvider.sendMessage(message);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: const BoxDecoration(
        color: appStyles.blueColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              // Handle back navigation
            },
            icon: Icon(
              appStyles.back,
              color: appStyles.whiteColor,
            ),
          ),
          const Text(
            "Web dev Community",
            style: appStyles.titleWhite,
          ),
        ],
      ),
    );
  }

  Widget _buildChatList(List<Map<String, dynamic>> messages) {
    return ListView.builder(
      itemCount: messages.length,
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, index) {
        final message = messages[index];
        final isSentByUser = message['isSentByUser'] ?? false;

        return Align(
          alignment:
              isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isSentByUser ? Colors.yellow[200] : Colors.yellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              message['text'] ?? '',
              style: const TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}

class MessageInputField extends StatelessWidget {
  final Function(String) onSend;

  MessageInputField({required this.onSend, Key? key}) : super(key: key);

  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      onSend(message);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        children: [
          // Input Field with Custom Style
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  hintText: "Type a message...",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                ),
                onSubmitted: (value) => _sendMessage(),
              ),
            ),
          ),

          const SizedBox(width: 8),

          // Send Button
          GestureDetector(
            onTap: _sendMessage,
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: appStyles.blueColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
