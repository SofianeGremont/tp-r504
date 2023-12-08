public class Client1 {
    public static void main(String[] args) {
        if (args.length > 0) {
            String url = args[0];
            System.out.println("URL fournie : " + url);
        } else {
            System.err.println("Erreur : Veuillez fournir au moins 1 argument (ex. ./run.sh www.mon-api.com)");
            System.exit(1);
        }
    }
}
