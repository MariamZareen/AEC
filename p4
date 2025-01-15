interface MessageService {
    void sendMessage(String message, String receiver);
   }
   // Email implementation of the service
   class EmailService implements MessageService {
    @Override
    public void sendMessage(String message, String receiver) {
    System.out.println("Email sent to " + receiver + " with message: " + message);
    }
   }
   // SMS implementation of the service
   class SMSService implements MessageService {
    @Override
    public void sendMessage(String message, String receiver) {
    System.out.println("SMS sent to " + receiver + " with message: " + message);
    }
   }
// Consumer class that depends on the service
class MessageProcessor {
    private MessageService messageService;
    // Constructor-based Dependency Injection
    public MessageProcessor(MessageService messageService) {
    this.messageService = messageService;
    }
    
    public void processMessage(String message, String receiver) {
        messageService.sendMessage(message, receiver);
        }
       }
       // Main class to test the implementation
       public class DependencyInjectionExample {
        public static void main(String[] args) {
        // Injecting EmailService dependency into MessageProcessor
        MessageService emailService = new EmailService();
        MessageProcessor emailProcessor = new MessageProcessor(emailService);
        emailProcessor.processMessage("Hello, Email!", "email@example.com");
        // Injecting SMSService dependency into MessageProcessor
        MessageService smsService = new SMSService();
        MessageProcessor smsProcessor = new MessageProcessor(smsService);
        smsProcessor.processMessage("Hello, SMS!", "123-456-7890");
        }
       }
       
