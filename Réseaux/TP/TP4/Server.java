
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.Random;


public class Server {
    // Constants
    private static final String CORRECT = "Correct !";
    private static final String WRONG = "Wrong !";
    private static String[] operations = new String[]{"+", "-", "*", "/"};

    public static void main(String[] var0) throws IOException {
        // Communication variables
        DatagramSocket ds = new DatagramSocket(3001);
        byte[] buffer = new byte[1024];
        DatagramPacket dp = new DatagramPacket(buffer,1024);
        InetAddress inetAddress = InetAddress.getByName("127.0.0.1");

        // Diverse
        Boolean exit = false;
        int score = 0;
        Operation op;
        Random rand = new Random();
        String solution;
        String question;
        String answer;
        
        while(!exit) {
            // Create operation
            op = new Operation(operations[rand.nextInt(4)],
                               rand.nextInt(100), 
                               rand.nextInt(100));
            solution = op.execute()+"";
            question = op.toString()+"?";

            // Send question
            ds.send(new DatagramPacket(question.getBytes(), 
                                       question.length(), 
                                       inetAddress, 3000));

            // Receive answer
            ds.receive(dp);
            answer = new String(dp.getData(), 0, dp.getLength());

            // Check answer
            if(answer.equals("exit")){ 
                exit = true;
            } else if(answer.equals(solution)){
                score ++;
                ds.send(new DatagramPacket(CORRECT.getBytes(), 
                                           CORRECT.length(), 
                                           inetAddress, 3000));
            } else {
                ds.send(new DatagramPacket(WRONG.getBytes(), 
                                           WRONG.length(), 
                                           inetAddress, 3000));
            }
        }
        ds.close();
    }
}
