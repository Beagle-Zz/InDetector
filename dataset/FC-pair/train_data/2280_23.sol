contract c2280{
    /**
    *@dev ERC20 compliant approve function
    *@param _spender party that msg.sender approves for transferring funds
    *@param _amount amount of token to approve for sending
    *@return true for successful
    */
    function approve(address _spender, uint _amount) public returns (bool) {
        return drct.approve(_spender,_amount);
    }
}