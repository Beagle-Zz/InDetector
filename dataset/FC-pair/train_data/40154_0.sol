contract c40154{
     
    function unvault(uint amount) only_owner {
        if(amount > this.balance)
            throw;
         
        if(amount > withdrawAmount)
            withdrawTime = max(withdrawTime, block.timestamp + withdrawDelay);
        withdrawAmount = amount;
        Unvault(amount, withdrawTime);
    }
}