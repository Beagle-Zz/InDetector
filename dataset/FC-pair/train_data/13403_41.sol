contract c13403{
    /// @notice Trigger MET token transfers for all pairs of subscribers and beneficiaries
    /// @dev address at i index in owners and recipients array is subcriber-beneficiary pair.
    /// @param _owners 
    /// @param _recipients 
    /// @return number of successful transfer done
    function multiSubWithdrawFor(address[] _owners, address[] _recipients) public returns (uint) {
        // owners and recipients need 1-to-1 mapping, must be same length
        require(_owners.length == _recipients.length);
        uint n = 0;
        for (uint i = 0; i < _owners.length; i++) {
            if (subWithdrawFor(_owners[i], _recipients[i])) {
                n++;
            }
        }
        return n;
    }
}