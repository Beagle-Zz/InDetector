contract c18928{
    /// @dev receiveApproval calls function encoded as extra data
    /// @param _sender token sender
    /// @param _value value allowed to be spent
    /// @param _tokenContract callee, should be equal to neverdieContractAddress
    /// @param _extraData  this should be a well formed calldata with function signature preceding which is used to call, for example, 'swap' method
    function receiveApproval(address _sender, uint256 _value, address _tokenContract, bytes _extraData) external {
        require(_tokenContract == address(ndc));
        assert(this.call(_extraData));
    }
}