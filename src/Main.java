public class Main {

    public static void main(String[] args) {
        try {
            java.net.InetAddress i = java.net.InetAddress.getLocalHost();
            System.out.println(i);                  // name and IP address
            System.out.println(i.getHostName());    // name
            System.out.println(i.getHostAddress()); // IP address only
            System.out.println("Hello World!");
        }
        catch(Exception e){e.printStackTrace();}
    }
}
