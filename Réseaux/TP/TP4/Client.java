import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.Scanner;

public class Client {
    public static void main(String[] args) throws IOException {
        DatagramSocket ds = new DatagramSocket(3000);
        byte[] buffer = new byte[1024];
        DatagramPacket dp = new DatagramPacket(buffer,1024);
        InetAddress inetAddress = InetAddress.getByName("127.0.0.1");
        Scanner scanner = new Scanner(System.in);

        String answer;
        String question;
        Boolean exit = false;

        while(!exit) {
            ds.receive(dp);

            System.out.println(new String(dp.getData(), 0, dp.getLength()));
            answer = scanner.next();
            if(answer.equals("exit")){
                exit = true;
            } else {
                ds.send(
                        new DatagramPacket(answer.getBytes(),
                                        answer.length(),
                                        inetAddress, 3001)
                );

                ds.receive(dp);
                System.out.println(new String(dp.getData(), 0, dp.getLength()));
            }
        }

        ds.close();
    }
}
