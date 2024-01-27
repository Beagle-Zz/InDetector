contract c16854{
   ///@notice Transfer tokens between accounts
   ///@param  from The benefactor/sender account.
   ///@param  to The beneficiary account
   ///@param  value The amount to be transfered  
        function transferFrom(address from, address to, uint value) returns (bool success){
            require(
            allowance[from][msg.sender] >= value
            &&balances[from] >= value                                                 //Check if the benefactor has sufficient balance
            && value > 0 
            && (!frozenAccount[msg.sender])                                           // Allow transfer only if account is not frozen
            );
            balances[from] = balances[from].sub(value);                               // Deduct from the benefactor account
            balances[to] =  balances[to].add(value);                                  // Update the balance of beneficiary account
            allowance[from][msg.sender] = allowance[from][msg.sender].sub(value);
            Transfer(from,to,value);
            return true;
        }
}