contract c2736{
    /// @dev Called by the sale contract to create a disbursement.
    /// @param _beneficiary The address of the beneficiary.
    /// @param _value Amount of tokens to be locked.
    /// @param _timestamp Funds will be locked until this timestamp.
    function setupDisbursement(
        address _beneficiary,
        uint256 _value,
        uint256 _timestamp
    )
        external
        onlyOwner
    {
        require(block.timestamp < _timestamp);
        disbursements[_beneficiary].push(Disbursement(_timestamp, _value));
        totalAmount = totalAmount.add(_value);
        emit Setup(_beneficiary, _timestamp, _value);
    }
}