contract c12115{
    /// @notice Returns the ether in escrow to the seller. Called by the seller. Sometimes unavailable.
    /// @param _tradeID Escrow "tradeID" parameter
    /// @param _seller Escrow "seller" parameter
    /// @param _buyer Escrow "buyer" parameter
    /// @param _value Escrow "value" parameter
    /// @param _fee Escrow "fee parameter
    /// @param _additionalGas Additional gas to be deducted after this operation
    /// @return bool
    function doSellerCancel(
        bytes16 _tradeID,
        address _seller,
        address _buyer,
        uint256 _value,
        uint16 _fee,
        uint128 _additionalGas
    ) private returns (bool) {
        Escrow memory _escrow;
        bytes32 _tradeHash;
        (_escrow, _tradeHash) = getEscrowAndHash(_tradeID, _seller, _buyer, _value, _fee);
        if (!_escrow.exists) {
            return false;
        }
        if(_escrow.sellerCanCancelAfter <= 1 || _escrow.sellerCanCancelAfter > block.timestamp) {
            return false;
        }
        uint128 _gasFees = _escrow.totalGasFeesSpentByRelayer
            + (msg.sender == relayer
                ? (GAS_doSellerCancel + _additionalGas ) * uint128(tx.gasprice)
                : 0
            );
        delete escrows[_tradeHash];
        emit CancelledBySeller(_tradeHash);
        transferMinusFees(_seller, _value, _gasFees, 0);
        return true;
    }
}