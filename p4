
  interface MsgService {
    void send(String msg, String to);
}

class EmailService implements MsgService {
    public void send(String msg, String to) {
        System.out.println("Email sent to " + to + ": " + msg);
    }
}

class Notifier {
    private MsgService service;

    public Notifier(MsgService service) {
        this.service = service;
    }

    public void alert(String msg, String to) {
        service.send(msg, to);
    }
}

public class Main {
    public static void main(String[] args) {
        Notifier notifier = new Notifier(new EmailService());
        notifier.alert("Hello!", "user@example.com");
    }
}     
