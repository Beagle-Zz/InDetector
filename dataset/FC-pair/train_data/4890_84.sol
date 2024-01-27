contract c4890{
    /// @notice Performs allowance transfer call on the platform by the name of specified sender.
    ///
    /// @dev Can only be called by proxy asset.
    ///
    /// @param _from holder address to take from.
    /// @param _to holder address to give to.
    /// @param _value amount to transfer.
    /// @param _reference transfer comment to be included in a platform's Transfer event.
    /// @param _sender initial caller.
    ///
    /// @return success.
    function __transferFromWithReference(
        address _from, 
        address _to, 
        uint _value, 
        string _reference, 
        address _sender
    ) 
    public 
    onlyProxy 
    returns (bool) 
    {
        var (_fromRole, _toRole) = _getParticipantRoles(_from, _to);
        // @note Special check for operational withdraw.
        bool _isTransferFromHolderToContractOwner = (_fromRole == Roles.Holder) && 
            (contractOwner == _to) && 
            (dataController.allowance(_from) >= _value) && 
            super.__transferFromWithReference(_from, _to, _value, _reference, _sender);
        if (_isTransferFromHolderToContractOwner) {
            return true;
        }
        if (!_checkTransferAllowanceFrom(_to, _toRole, _value, _from, _fromRole, _sender)) {
            return false;
        }
        if (!_isValidCountryLimits(_to, _toRole, _value, _from, _fromRole)) {
            return false;
        }
        if (!super.__transferFromWithReference(_from, _to, _value, _reference, _sender)) {
            return false;
        }
        _updateTransferLimits(_to, _toRole, _value, _from, _fromRole);
        _contractFallbackERC223(_from, _to, _value);
        return true;
    }
}