contract c12115{
    /// @notice Called by the arbitrator to resolve a dispute. Requires a signature from either party.
    /// @param _tradeID Escrow "tradeID" parameter
    /// @param _seller Escrow "seller" parameter
    /// @param _buyer Escrow "buyer" parameter
    /// @param _value Escrow "value" parameter
    /// @param _fee Escrow "fee parameter
    /// @param _v Signature "v" component
    /// @param _r Signature "r" component
    /// @param _s Signature "s" component
    /// @param _buyerPercent What % should be distributed to the buyer (this is usually 0 or 100)
    function resolveDispute(
        bytes16 _tradeID,
        address _seller,
        address _buyer,
        uint256 _value,
        uint16 _fee,
        uint8 _v,
        bytes32 _r,
        bytes32 _s,
        uint8 _buyerPercent
    ) external onlyArbitrator {
        address _signature = recoverAddress(keccak256(abi.encodePacked(
            _tradeID,
            INSTRUCTION_RESOLVE
        )), _v, _r, _s);
        require(_signature == _buyer || _signature == _seller, "Must be buyer or seller");
        Escrow memory _escrow;
        bytes32 _tradeHash;
        (_escrow, _tradeHash) = getEscrowAndHash(_tradeID, _seller, _buyer, _value, _fee);
        require(_escrow.exists, "Escrow does not exist");
        require(_buyerPercent <= 100, "_buyerPercent must be 100 or lower");
        uint256 _totalFees = _escrow.totalGasFeesSpentByRelayer + (GAS_doResolveDispute * uint128(tx.gasprice));
        require(_value - _totalFees <= _value, "Overflow error"); // Prevent underflow
        feesAvailableForWithdraw += _totalFees; // Add the the pot for localethereum to withdraw
        delete escrows[_tradeHash];
        emit DisputeResolved(_tradeHash);
        if (_buyerPercent > 0)
          _buyer.transfer((_value - _totalFees) * _buyerPercent / 100);
        if (_buyerPercent < 100)
          _seller.transfer((_value - _totalFees) * (100 - _buyerPercent) / 100);
    }
}