contract c12115{
    /// @notice Disable the seller from cancelling (i.e. "mark as paid"). Direct call option.
    /// @param _tradeID Escrow "tradeID" parameter
    /// @param _seller Escrow "seller" parameter
    /// @param _buyer Escrow "buyer" parameter
    /// @param _value Escrow "value" parameter
    /// @param _fee Escrow "fee parameter
    /// @return bool
    function disableSellerCancel(
        bytes16 _tradeID,
        address _seller,
        address _buyer,
        uint256 _value,
        uint16 _fee
    ) external returns (bool) {
        require(msg.sender == _buyer, "Must be buyer");
        return doDisableSellerCancel(_tradeID, _seller, _buyer, _value, _fee, 0);
    }
}