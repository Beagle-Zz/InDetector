contract c16047{
    /**
    * This function is internally called by the buyTokens function to automatically forward
    * all investments made to the multi signature wallet. 
    **/
    function forwardFunds() internal {
        multiSigWallet.transfer(msg.value);
    }
}