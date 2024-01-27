contract c7394{
    /**
    * @dev transfer token for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[msg.sender]);
    if(msg.sender == owner){
            if(now >= 1533128400 && now < 1534337940){
                privatePreSale = privatePreSale.sub(_value);
            } else if(now >= 1534338000 && now < 1535547600){
                openPreSale = openPreSale.sub(_value);
            }  else if(now > 1536152400 && now < 1542204000){ 
                openSale = openSale.sub(_value);
            } 
        }
        // SafeMath.sub will throw if there is not enough balance.
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}