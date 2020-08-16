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
    if self.valid?
      if @sender.balance < @amount
        "Transaction rejected.  Check account funds."
        @status = "rejected"
      else
        @sender.balance = @sender.balance - @amount
        @receiver.balance = @receiver.balance - @amount
        @status = "complete"
      end
    end
  end
  
end
