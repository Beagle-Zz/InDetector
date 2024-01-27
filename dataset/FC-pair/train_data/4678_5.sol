contract c4678{
    /**
    @notice Inititate/extend multisig unlockTime and/or initiate/refund multisig deposit
    @dev Can increase deposit and/or unlockTime but not owner or authority
    @param msigId Unique (owner, authority, balance != 0) multisig identifier
    @param unlockTime Lock Ether until unlockTime in seconds.
    */
    function reparametrizeMultisig(bytes32 msigId, uint unlockTime)
        public
        payable
    {
        require(multisigs[msigId].owner == msg.sender);
        Multisig storage multisig = multisigs[msigId];
        multisig.deposit = add(multisig.deposit, msg.value);
        assert(multisig.unlockTime <= unlockTime); // Can only increase unlockTime
        multisig.unlockTime = unlockTime;
        emit MultisigReparametrized(msigId);
    }
}