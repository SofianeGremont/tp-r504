import java.io.*;
import java.net.*;

public class ClientHTTP {
    public static void main(String[] args) {
        try {
            if (args.length != 1) {
                System.out.println("Veuillez fournir l'URL en argument.");
                return;
            }

            String urlString = args[0];
            if (!urlString.startsWith("http://") && !urlString.startsWith("https://")) {
                urlString = "http://" + urlString;
            }

            URL url = new URL(urlString);
            String host = url.getHost();

            Socket socket = new Socket(host, 80);

            OutputStreamWriter osw = new OutputStreamWriter(socket.getOutputStream());
            InputStreamReader isr = new InputStreamReader(socket.getInputStream());
            BufferedWriter bufOut = new BufferedWriter(osw);
            BufferedReader bufIn = new BufferedReader(isr);

            String request = "GET / HTTP/1.0\r\n\r\n";
            bufOut.write(request, 0, request.length());
            bufOut.flush();

            String line = bufIn.readLine();
            while (line != null) {
                System.out.println(line);
                line = bufIn.readLine();
            }

            bufIn.close();
            bufOut.close();
            socket.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
