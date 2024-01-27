contract c1420{
    /**
     * @dev In this 1st option for ownership transfer `proposeOwnership()` must
     *  be called first by the current `owner` then `acceptOwnership()` must be
     *  called by the `newOwnerCandidate`
     * @notice `onlyOwner` Proposes to transfer control of the contract to a
     *  new owner
     * @param _newOwnerCandidate The address being proposed as the new owner
     */
    function proposeOwnership(address _newOwnerCandidate) external onlyOwner {
        newOwnerCandidate = _newOwnerCandidate;
        emit OwnershipRequested(msg.sender, newOwnerCandidate);
    }
}