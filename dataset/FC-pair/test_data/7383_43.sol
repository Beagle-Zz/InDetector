contract c7383{
    /**
    * @dev Transfers tokens held by timelock to recipients multiply.
    * @param _recipients address list of the recipients to whom received tokens 
    * @param _values the amount list of tokens to be transferred
    * #param _defaultExpiresAtList default release times
    */
    function transferLockedMultiply
    (
        address[] _recipients,
        uint256[] _values,
        uint256[] _lockAmounts,
        uint256[] _defaultExpiresAtList
    )
        public
        onlyOwnerOrAdmin(ROLE_LOCKUP)
        returns (bool)
    {
        uint length = _recipients.length;
        require(length > 0);
        require(length == _values.length && length == _lockAmounts.length);
        require(_defaultExpiresAtList.length > 0);
        for (uint i = 0; i < length; i++) {
            require(transferLocked(
                _recipients[i], 
                _values[i], 
                _lockAmounts[i], 
                _defaultExpiresAtList
            ));
        }
        return true;
    }
}