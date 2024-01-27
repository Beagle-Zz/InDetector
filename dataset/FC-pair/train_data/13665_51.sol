contract c13665{
    //EMERGENCY CALLS
    //If something goes wrong or fails, these functions will allow retribution for token holders 
    /**
    * @notice if there is an unresolvable problem, users can call to this function to get a refund.
    */
    function emergencyWithdraw() external hasFinalized{
        uint256 balance = STARTING_PRICE * tokensOfOwnerMap[msg.sender].length;
        delete tokensOfOwnerMap[msg.sender];
        msg.sender.transfer(balance);
    }
}