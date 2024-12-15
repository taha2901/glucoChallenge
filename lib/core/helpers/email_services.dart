import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailService {
  final String username = 'basmala@gmail.com'; // استبدل بـ Gmail الخاص بك
  final String password = 'Taha1Medo?'; // استبدل بكلمة المرور الخاصة بك

  Future<void> sendEmail(String toEmail, String subject, String body) async {
    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username)
      ..recipients.add(toEmail)
      ..subject = subject
      ..text = body;

    try {
      await send(message, smtpServer);
      print('Email sent!');
    } on MailerException catch (e) {
      print('Error: $e');
    }
  }
}
