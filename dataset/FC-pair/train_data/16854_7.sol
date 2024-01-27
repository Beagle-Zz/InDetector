contract c16854{
   ///@notice Transfer tokens to the beneficiary account
   ///@param  to The beneficiary account
   ///@param  value The amount of tokens to be transfered 
        function transfer(address to, uint value) returns (bool success){
        require(
            balances[msg.sender] >= value 
            && value > 0 
            && (!frozenAccount[msg.sender]) 										// Allow transfer only if account is not frozen
            );
            balances[msg.sender] = balances[msg.sender].sub(value);                 
            balances[to] = balances[to].add(value);                               // Update the balance of beneficiary account
			Transfer(msg.sender,to,value);
            return true;
    }
}