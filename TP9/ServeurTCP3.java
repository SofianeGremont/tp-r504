import java.io.*;
import java.net.*;

public class ServeurTCP3 {
    public static void main(String[] args) {
        try {
            ServerSocket socketserver = new ServerSocket(2016);
            System.out.println("Serveur en attente");

            while (true) {
                Socket socket = socketserver.accept();
                System.out.println("Connexion d'un client");

                DataInputStream dIn = new DataInputStream(socket.getInputStream());
                String receivedMsg = dIn.readUTF();

                String reversedMsg = new StringBuilder(receivedMsg).reverse().toString();
                System.out.println("Message inversé: " + reversedMsg);

                DataOutputStream dOut = new DataOutputStream(socket.getOutputStream());
                dOut.writeUTF(reversedMsg);

                socket.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
