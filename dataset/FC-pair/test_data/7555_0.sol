contract c7555{
    //mint the tokens, can be called only by owner. total supply also increases
    function mintTokens(address seller, uint256 _amount) external onlyOwner{
        require(Max_Mintable >= (Totalsupply + _amount) && _amount > 0);
        require( seller != 0x0 && _amount > 0);
        balances[seller] = (balances[seller]).add(_amount);
        Totalsupply = (Totalsupply).add(_amount);
        emit Transfer(0, seller, _amount);
       }
}