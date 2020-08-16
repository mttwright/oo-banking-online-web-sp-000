class Transfer
  
  attr_reader :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if @sender.status == "open"
      
      if @sender.balance < @amount
        @status = "rejected"
        "Transaction rejected.  Please check your account balance."
      elsif @status == "pending"
        @sender.balance=(@sender.balance - @amount)
        @receiver.balance=(@receiver.balance + @amount)
        @status = "complete"
      else
        @sender.balance
      end
      
    else
      "Transaction rejected.  Please check your account balance."
    end
  end
  
end
