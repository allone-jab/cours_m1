import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

public class Sender {
    public static void main(String[] args) throws IOException {
        DatagramSocket ds = new DatagramSocket();

        String message = "Ping";

        InetAddress inetAddress = InetAddress.getByName("127.0.0.1");

        DatagramPacket dp = new DatagramPacket(message.getBytes(), message.length(), inetAddress, 3000);

        ds.send(dp);

        ds.close();
    }
}
