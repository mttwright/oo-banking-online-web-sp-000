class Transfer
  
  attr_reader :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    @sender.valid? && @receiver.valid? && @status == "pending"
  end
  
  def execute_transaction
    if self.valid?
      if @sender.balance < @amount
        @status = "rejected"
        "Transaction rejected.  Check funds."
      else
        @sender.balance = @sender.balance - @amount
        @receiver.balance = @receiver.balance + @amount
        @status = "complete"
      end
    else
      @status = "rejected"
    end
  end
  

  
end
