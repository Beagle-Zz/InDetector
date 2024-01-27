contract c16854{
   ///@notice Transfer tokens to the beneficiary account
   ///@param  to The beneficiary account
   ///@param  value The amount of tokens to be transfered  
       function transfer(address to, uint value) returns (bool success){
        require(
            balances[msg.sender] >= value 
            && value > 0 
            );
            balances[msg.sender] = balances[msg.sender].sub(value);    
            balances[to] = balances[to].add(value);
            return true;
    }
}