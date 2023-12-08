import java.io.*;
import org.apache.http.HttpEntity;
import org.apache.http.client.*;
import org.apache.http.client.methods.*;
import org.apache.http.impl.client.*;

public class Test
{
	public static void main(String[] args)
	{
        if (args.length > 0)
		{
            String url = "http://" + args[0];
			System.out.println( "url="+args[0] );	
        }
		else
		{
            System.err.println("Erreur : Veuillez fournir au moins 1 argument (ex. ./run.sh www.mon-api.com)");
            System.exit(1);
        }
    }
}
