import java.io.*;
import org.apache.http.HttpEntity;
import org.apache.http.client.*;
import org.apache.http.client.methods.*;
import org.apache.http.impl.client.*;
import javax.json.*;

public class Client2 {
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
                    try (Reader reader = new InputStreamReader(entity.getContent())) {
                        JsonReader jsonReader = Json.createReader(reader);

                        JsonObject jsonObject = jsonReader.readObject();

                        String runtime = jsonObject.getString("Runtime");

                        System.out.println("Durée = " + runtime);

                        jsonReader.close();
                    }
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
