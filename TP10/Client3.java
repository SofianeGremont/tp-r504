import java.io.*;
import org.apache.http.HttpEntity;
import org.apache.http.client.*;
import org.apache.http.client.methods.*;
import org.apache.http.impl.client.*;
import javax.json.*;
import java.util.Scanner;

public class Client3 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.print("Entrez le titre du film (ou 'exit' pour quitter) : ");
            String title = scanner.nextLine();

            if ("exit".equalsIgnoreCase(title)) {
                break;
            }

            CloseableHttpClient client = HttpClients.createDefault();
            HttpGet request = new HttpGet("http://omdbapi.com?apikey=751ea6aa&t=" + title);

            try {
                System.out.println("Executing request " + request.getRequestLine());
                CloseableHttpResponse resp = client.execute(request);
                HttpEntity entity = resp.getEntity();

                if (entity != null) {
                    try (Reader reader = new InputStreamReader(entity.getContent())) {
                        JsonReader jsonReader = Json.createReader(reader);
                        JsonObject jsonObject = jsonReader.readObject();

                        if ("False".equalsIgnoreCase(jsonObject.getString("Response"))) {
                            System.out.println("Aucun film trouvé pour le titre : " + title);
                            continue;
                        }

                        System.out.println("Date de sortie : " + jsonObject.getString("Released"));
                        System.out.println("Acteurs principaux : " + jsonObject.getString("Actors"));

                        JsonArray ratingsArray = jsonObject.getJsonArray("Ratings");
                        String rottenTomatoesScore = findRottenTomatoesScore(ratingsArray);

                        System.out.println("Score avis positif : " + rottenTomatoesScore);

                        int scoreInt = parseRottenTomatoesScore(rottenTomatoesScore);
                        String mention = determinerMention(scoreInt);
                        System.out.println("Mention : " + mention);

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
        }

        scanner.close();
    }

    private static String findRottenTomatoesScore(JsonArray ratingsArray) {
        for (int i = 0; i < ratingsArray.size(); i++) {
            JsonObject rating = ratingsArray.getJsonObject(i);
            if ("Rotten Tomatoes".equals(rating.getString("Source"))) {
                return rating.getString("Value");
            }
        }
        return "N/A";
    }

    private static int parseRottenTomatoesScore(String score) {
        try {
            return Integer.parseInt(score.replaceAll("%", ""));
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private static String determinerMention(int score) {
        if (score < 20) {
            return "Nul";
        } else if (score >= 20 && score <= 50) {
            return "Bof";
        } else if (score > 50 && score <= 70) {
            return "Bien";
        } else {
            return "Très bien";
        }
    }
}
