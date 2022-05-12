import 'dart:async';
import 'dart:io';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
final client = MqttServerClient('broker.mqttdashboard.com', 'MyFlutterApplication2022');
var pongCount = 0; // Pong counter
const topic = 'test/fady1'; // Not a wildcard topic
int x = 0;
void m1() {
  client.logging(on: false);
  client.setProtocolV311();
  client.keepAlivePeriod = 60;
  client.onDisconnected = onDisconnected;
  client.onConnected = onConnected;
  client.onSubscribed = onSubscribed;
  client.pongCallback = pong;
  final connMess = MqttConnectMessage()
      .withClientIdentifier('Mqtt_MyClientUniqueId')
      .withWillTopic('willtopic') // If you set this you must set a will message
      .withWillMessage('My Will message')
      .startClean() // Non persistent session for testing
      .withWillQos(MqttQos.atLeastOnce);
  print('EXAMPLE::Mosquitto client connecting....');
  client.connectionMessage = connMess;
}
void m2() async {
  try {
    await client.connect();
  } on NoConnectionException catch (e) {
    // Raised by the client when connection fails.
    print('EXAMPLE::client exception - $e');
    client.disconnect();
  } on SocketException catch (e) {
    // Raised by the socket layer
    print('EXAMPLE::socket exception - $e');
    client.disconnect();
  }
}
void m3(String directionnn) {
  /// Check we are connected
  if (client.connectionStatus!.state == MqttConnectionState.connected) {
    print('EXAMPLE::Mosquitto client connected');
  } else {
    /// Use status here rather than state if you also want the broker return code.
    print(
        'EXAMPLE::ERROR Mosquitto client connection failed - disconnecting, status is ${client
            .connectionStatus}');
    client.disconnect();
    exit(-1);
  }

  /// Ok, lets try a subscription
  print('EXAMPLE::Subscribing to the test/lol topic');
  client.subscribe(topic, MqttQos.atMostOnce);

  /// The client has a change notifier object(see the Observable class) which we then listen to to get
  /// notifications of published updates to each subscribed topic.
  client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
    final recMess = c![0].payload as MqttPublishMessage;
    final pt =
    MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

    /// The above may seem a little convoluted for users only interested in the
    /// payload, some users however may be interested in the received publish message,
    /// lets not constrain ourselves yet until the package has been in the wild
    /// for a while.
    /// The payload is a byte buffer, this will be specific to the topic
    print(
        'EXAMPLE::Change notification:: topic is <${c[0]
            .topic}>, payload is <-- $pt -->');
    print('');
  });

  /// If needed you can listen for published messages that have completed the publishing
  /// handshake which is Qos dependant. Any message received on this stream has completed its
  /// publishing handshake with the broker.
  client.published!.listen((MqttPublishMessage message) {
    print(
        'EXAMPLE::Published notification:: topic is ${message.variableHeader!
            .topicName}, with Qos ${message.header!.qos}');
  });

  /// Lets publish to our topic
  /// Use the payload builder rather than a raw buffer
  /// Our known topic to publish to
  const pubTopic = 'test/fady2';
  final builder = MqttClientPayloadBuilder();
  builder.addString(directionnn);

  /// Subscribe to it
  print('EXAMPLE::Subscribing to the Dart/Mqtt_client/testtopic topic');
  client.subscribe(pubTopic, MqttQos.exactlyOnce);

  /// Publish it
  print('EXAMPLE::Publishing our topic');
  client.publishMessage(pubTopic, MqttQos.exactlyOnce, builder.payload!);
}
Future<int> m4() async{
  /// Ok, we will now sleep a while, in this gap you will see ping request/response
  /// messages being exchanged by the keep alive mechanism.
  print('EXAMPLE::Sleeping....');
  await MqttUtilities.asyncSleep(60);

  /// Finally, unsubscribe and exit gracefully
  print('EXAMPLE::Unsubscribing');
  client.unsubscribe(topic);

  /// Wait for the unsubscribe message from the broker if you wish.
  await MqttUtilities.asyncSleep(2);
  print('EXAMPLE::Disconnecting');
  client.disconnect();
  print('EXAMPLE::Exiting normally');
  return 0;
}

/// The subscribed callback
void onSubscribed(String topic) {
  print('EXAMPLE::Subscription confirmed for topic $topic');
} //printing the onSubscribed FLAG

/// The unsolicited disconnect callback
void onDisconnected() {
  print('EXAMPLE::OnDisconnected client callback - Client disconnection');
  if (client.connectionStatus!.disconnectionOrigin ==
      MqttDisconnectionOrigin.solicited) {
    print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
  } else {
    print(
        'EXAMPLE::OnDisconnected callback is unsolicited or none, this is incorrect - exiting');
    exit(-1);
  }
  if (pongCount == 3) {
    print('EXAMPLE:: Pong count is correct');
  } else {
    print('EXAMPLE:: Pong count is incorrect, expected 3. actual $pongCount');
  }
} //printing the onDisconnected FLAG

/// The successful connect callback
void onConnected() {
  print(
      'EXAMPLE::OnConnected client callback - Client connection was successful');
} //printing the onConnected FLAG

/// Pong callback
void pong() {
  print('EXAMPLE::Ping response client callback invoked');
  pongCount++;
} //printing the Ping FLAG