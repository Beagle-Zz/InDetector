contract c12115{
    /// @notice Get the sender of the signed instruction.
    /// @param _tradeID Identifier of the trade
    /// @param _instructionByte Identifier of the instruction
    /// @param _maximumGasPrice Maximum gas price permitted by the sender
    /// @param _v Signature "v" component
    /// @param _r Signature "r" component
    /// @param _s Signature "s" component
    /// @return address
    function getRelayedSender(
      bytes16 _tradeID,
      uint8 _instructionByte,
      uint128 _maximumGasPrice,
      uint8 _v,
      bytes32 _r,
      bytes32 _s
    ) view private returns (address) {
        bytes32 _hash = keccak256(abi.encodePacked(
            _tradeID,
            _instructionByte,
            _maximumGasPrice
        ));
        if(tx.gasprice > _maximumGasPrice) {
            return;
        }
        return recoverAddress(_hash, _v, _r, _s);
    }
}