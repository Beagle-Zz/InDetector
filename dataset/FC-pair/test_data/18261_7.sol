contract c18261{
    /**
     * @dev Finish token issuance
     * @return True if success
     */
    function finishIssuance() public onlyOwner returns (bool) {
        issuanceFinished = true;
        IssuanceFinished();
        return true;
    }
}