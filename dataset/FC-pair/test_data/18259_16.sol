contract c18259{
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