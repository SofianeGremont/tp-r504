import java.io.*;
import java.net.*;

public class ServeurUDP {
    public static void main(String[] args) {
        try {
            DatagramSocket sock = new DatagramSocket(1234);

            while (true) {
                System.out.println("-En attente-");

                DatagramPacket receivePacket = new DatagramPacket(new byte[1024], 1024);
                sock.receive(receivePacket);

                String receivedStr = new String(receivePacket.getData());
                System.out.println("Message reçu du client : " + receivedStr.trim());

                InetAddress clientAddr = receivePacket.getAddress();
                int clientPort = receivePacket.getPort();

                String responseStr = "Message reçu : " + receivedStr.trim();
                byte[] responseData = responseStr.getBytes();

                DatagramPacket sendPacket = new DatagramPacket(responseData, responseData.length, clientAddr, clientPort);
                sock.send(sendPacket);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
