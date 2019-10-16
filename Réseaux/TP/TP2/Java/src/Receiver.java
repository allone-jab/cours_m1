import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;

public class Receiver {
    public static void main(String[] args) throws SocketException, IOException {
        DatagramSocket ds = new DatagramSocket(3000);

        byte[] buffer = new byte[1024];

        DatagramPacket dp = new DatagramPacket(buffer,1024);

        ds.receive(dp);

        String message = new String(dp.getData(), 0, dp.getLength());

        System.out.println(message);

        ds.close();
    }
}
