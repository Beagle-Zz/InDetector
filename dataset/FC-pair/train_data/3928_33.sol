contract c3928{
    /**
     * @notice Finish token minting, enable transfers and transfer token ownership
     */
    function finishDistribution() onlyOwner public {
        token.finishMinting();
        token.setTransferEnabled(true);
        token.transferOwnership(owner);
    }
}