contract c16854{
   ///@notice Transfer tokens between accounts
   ///@param  from The benefactor/sender account.
   ///@param  to The beneficiary account
   ///@param  value The amount to be transfered  
    function transferFrom(address from, address to, uint value) returns (bool success){
        require(
            allowance[from][msg.sender] >= value
            &&balances[from] >= value
            && value > 0
            );
            balances[from] = balances[from].sub(value);
            balances[to] =  balances[to].add(value);
            allowance[from][msg.sender] = allowance[from][msg.sender].sub(value);
            return true;
        }
}