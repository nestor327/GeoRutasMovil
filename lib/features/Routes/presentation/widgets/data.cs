// ✅   L – Liskov Substitution Principle

// ✅   Cualquier clase que implemente IPaymentProcessor 
//       puede sustituirse sin romper el sistema
public class PaymentService
{
    private readonly IPaymentProcessor _processor;

    public PaymentService(IPaymentProcessor processor)
    {
        _processor = processor;
    }

    public void MakePayment(Payment payment)
    {
        _processor.ProcessPayment(payment);
    }
}
