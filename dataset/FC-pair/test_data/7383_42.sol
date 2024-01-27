contract c7383{
    /**
    * @dev Transfers tokens to recipients multiply.
    * @param _recipients address list of the recipients to whom received tokens 
    * @param _values the amount list of tokens to be transferred
    */
    function transferMultiply
    (
        address[] _recipients,
        uint256[] _values
    )
        public
        returns (bool)
    {
        uint length = _recipients.length;
        require(length > 0);
        require(length == _values.length);
        for (uint i = 0; i < length; i++) {
            require(transfer(
                _recipients[i], 
                _values[i]
            ));
        }
        return true;
    }
}