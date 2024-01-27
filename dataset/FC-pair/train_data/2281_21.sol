contract c2281{
    /**
    *ERC20 compliant transfer function
    *@param _to Address to send funds to
    *@param _amount Amount of token to send
    *@return true for successful
    */
    function transfer(address _to, uint _amount) public returns (bool) {
        return drct.transfer(_to,_amount);
    }
}