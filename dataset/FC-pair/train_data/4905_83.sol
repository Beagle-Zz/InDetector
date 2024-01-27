contract c4905{
    /// @notice Performs transfer call on the platform by the name of specified sender.
    ///
    /// @dev Can only be called by proxy asset.
    ///
    /// @param _to holder address to give to.
    /// @param _value amount to transfer.
    /// @param _reference transfer comment to be included in a platform's Transfer event.
    /// @param _sender initial caller.
    ///
    /// @return success.
    function __transferWithReference(
        address _to, 
        uint _value, 
        string _reference, 
        address _sender
    ) 
    onlyProxy 
    public 
    returns (bool) 
    {
        var (_fromRole, _toRole) = _getParticipantRoles(_sender, _to);
        if (!_checkTransferAllowance(_to, _toRole, _value, _sender, _fromRole)) {
            return false;
        }
        if (!_isValidCountryLimits(_to, _toRole, _value, _sender, _fromRole)) {
            return false;
        }
        if (!super.__transferWithReference(_to, _value, _reference, _sender)) {
            return false;
        }
        _updateTransferLimits(_to, _toRole, _value, _sender, _fromRole);
        _contractFallbackERC223(_sender, _to, _value);
        return true;
    }
}