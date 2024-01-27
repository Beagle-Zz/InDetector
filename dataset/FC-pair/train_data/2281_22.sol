contract c2281{
    /**
    *@dev ERC20 compliant transferFrom function
    *@param _from address to send funds from (must be allowed, see approve function)
    *@param _to address to send funds to
    *@param _amount amount of token to send
    *@return true for successful transfer
    */
    function transferFrom(address _from, address _to, uint _amount) public returns (bool) {
        return drct.transferFrom(_from,_to,_amount);
    }
}