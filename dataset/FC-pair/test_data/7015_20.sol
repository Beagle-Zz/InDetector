contract c7015{
    //approveAndCall flow for selling entry point
    function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) external {
        //not needed: if it was the wrong token, the tx fails anyways require(_token == address(tokenContract));
        sellOneStep(_value, 0, _from);
    }
}