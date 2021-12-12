class Message {
  final String text;
  final String time;
  final String senderNumber;
  Message({
    required this.text,
    required this.time,
    required this.senderNumber,
  });
}

final List<Message> messagesList = [
  // Conversation 1

  Message(text: 'Hi Doctor', time: '08:00 AM', senderNumber: '123456789'),
  Message(text: 'Hello', time: '08:01 AM', senderNumber: '444333999'),
  Message(text: 'How are you?', time: '08:02 AM', senderNumber: '123456789'),
  Message(
      text: 'I am doing fine. you?',
      time: '08:03 AM',
      senderNumber: '444333999'),
  Message(
      text: 'I have this rash on my genitals',
      time: '08:04 AM',
      senderNumber: '123456789'),
  Message(
      text: 'Which kind of rash if i may ask',
      time: '08:05 AM',
      senderNumber: '444333999'),
  Message(
      text: 'A red rash with some virginal discharges',
      time: '08:08 AM',
      senderNumber: '123456789'),
  Message(
      text: 'Describe the discharges',
      time: '08:09 AM',
      senderNumber: '123456789'),
  Message(
      text: 'I love that show so much.',
      time: '08:10 AM',
      senderNumber: '444333999'),
  Message(text: 'Yes me too!', time: '08:15 AM', senderNumber: '123456789'),
  Message(
      text: 'Greenish yellow discharge',
      time: '08:22 AM',
      senderNumber: '444333999'),
  // Message(text: 'I would love to', time: '08:25 AM', senderNumber: '123456789'),
  // Message(
  //     text: 'Where are we going?', time: '08:35 AM', senderNumber: '123456789'),
  // Message(
  //     text: 'Around lake beach? What do you say?',
  //     time: '08:37 AM',
  //     senderNumber: '444333999'),
  // Message(
  //     text: 'Sure see you around then ;)',
  //     time: '08:37 AM',
  //     senderNumber: '123456789'),
];
