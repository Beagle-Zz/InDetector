contract c16211{
    /**
     * Function is called internally by the buyTokens() function in order to send 
     * ETH to owners of the ICO automatically. 
     * */
    function forwardFunds() internal {
        if(stateOfICO == StateOfICO.PRE) {
            receiverOne.transfer(msg.value.div(2));
            receiverTwo.transfer(msg.value.div(2));
        } else {
            receiverThree.transfer(msg.value);
        }
    }
}