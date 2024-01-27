contract c12386{
    // get the approved amount of tokens to deposit
    function approvedAmount(address _from) public constant returns (uint256) {
        return Token.allowance(_from, this);
    }
}