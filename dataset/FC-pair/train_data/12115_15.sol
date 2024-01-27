contract c12115{
    /// @notice Relay a signed instruction from a party of an escrow.
    /// @param _tradeID Escrow "tradeID" parameter
    /// @param _seller Escrow "seller" parameter
    /// @param _buyer Escrow "buyer" parameter
    /// @param _value Escrow "value" parameter
    /// @param _fee Escrow "fee parameter
    /// @param _maximumGasPrice Maximum gas price permitted for the relayer (set by the instructor)
    /// @param _v Signature "v" component
    /// @param _r Signature "r" component
    /// @param _s Signature "s" component
    /// @param _additionalGas Additional gas to be deducted after this operation
    /// @return bool
    function relay(
        bytes16 _tradeID,
        address _seller,
        address _buyer,
        uint256 _value,
        uint16 _fee,
        uint128 _maximumGasPrice,
        uint8 _v,
        bytes32 _r,
        bytes32 _s,
        uint8 _instructionByte,
        uint128 _additionalGas
    ) private returns (bool) {
        address _relayedSender = getRelayedSender(
            _tradeID,
            _instructionByte,
            _maximumGasPrice,
            _v,
            _r,
            _s
        );
        if (_relayedSender == _buyer) {
            // Buyer's instructions:
            if (_instructionByte == INSTRUCTION_SELLER_CANNOT_CANCEL) {
                // Disable seller from cancelling
                return doDisableSellerCancel(_tradeID, _seller, _buyer, _value, _fee, _additionalGas);
            } else if (_instructionByte == INSTRUCTION_BUYER_CANCEL) {
                // Cancel
                return doBuyerCancel(_tradeID, _seller, _buyer, _value, _fee, _additionalGas);
            }
        } else if (_relayedSender == _seller) {
            // Seller's instructions:
            if (_instructionByte == INSTRUCTION_RELEASE) {
                // Release
                return doRelease(_tradeID, _seller, _buyer, _value, _fee, _additionalGas);
            } else if (_instructionByte == INSTRUCTION_SELLER_CANCEL) {
                // Cancel
                return doSellerCancel(_tradeID, _seller, _buyer, _value, _fee, _additionalGas);
            } else if (_instructionByte == INSTRUCTION_SELLER_REQUEST_CANCEL){
                // Request to cancel
                return doSellerRequestCancel(_tradeID, _seller, _buyer, _value, _fee, _additionalGas);
            }
        } else {
            require(msg.sender == _seller, "Unrecognised party");
            return false;
        }
    }
}