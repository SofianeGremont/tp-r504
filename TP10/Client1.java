import java.io.*;
import org.apache.http.HttpEntity;
import org.apache.http.client.*;
import org.apache.http.client.methods.*;
import org.apache.http.impl.client.*;

public class Client1 {
    public static void main(String[] args) {
        if (args.length > 0) {
            String url = "http://" + args[0];

            CloseableHttpClient client = HttpClients.createDefault();

            HttpGet request = new HttpGet(url);

            try {
                System.out.println("Executing request " + request.getRequestLine());

                CloseableHttpResponse resp = client.execute(request);

                HttpEntity entity = resp.getEntity();
                if (entity != null) {
                    BufferedReader rd = new BufferedReader(new InputStreamReader(entity.getContent()));

                    StringBuffer result = new StringBuffer();
                    String line;
                    while ((line = rd.readLine()) != null) {
                        result.append(line);
                        result.append("\n");
                    }

                    String page = result.toString();

                    System.out.println(page);
                }

                resp.close();
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                try {
                    client.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } else {
            System.err.println("Erreur : Veuillez fournir au moins 1 argument (ex. ./run.sh www.mon-api.com)");
            System.exit(1);
        }
    }
}
