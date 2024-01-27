contract c7570{
    /*==================================================================== */
    /*======================== EXTERNAL FUNCTIONS ======================== */
    /*==================================================================== */
    /**
    * @dev Change the private contribution, in ether, wei units.
    * Private contribution amount will be calculated into funding goal.
    */
    function changePrivateContribution(uint256 etherWeiAmount) external onlyOwner {
        privateContribution = etherWeiAmount;
    }
}