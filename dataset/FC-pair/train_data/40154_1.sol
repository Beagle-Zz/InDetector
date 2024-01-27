contract c40154{
     
    function withdraw() only_owner {
        if(block.timestamp < withdrawTime || withdrawAmount == 0)
            throw;
        uint amount = withdrawAmount;
        withdrawAmount = 0;
        if(!owner.send(amount))
            throw;
        Withdraw(owner, amount);
    }
}