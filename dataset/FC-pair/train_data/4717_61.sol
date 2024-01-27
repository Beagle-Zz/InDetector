contract c4717{
     /**
    * @dev Perform crowdsale finalization. 
    * - Finish token minting
    * - Enable transfers
    * - Give back the token ownership to the admin
    */
    function finalization() internal {
        DroneMadnessToken dmToken = DroneMadnessToken(token);
        dmToken.finishMinting();
        dmToken.unpause();
        super.finalization();
        transferTokenOwnership(owner);
        airdropPool.transferOwnership(owner);
        advisorPool.transferOwnership(owner);
    }
}