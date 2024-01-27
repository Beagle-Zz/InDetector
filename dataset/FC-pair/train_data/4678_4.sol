contract c4678{
    // PUBLIC METHODS
    /**
    @notice Initialise and reparametrize Multisig
    @dev Uses msg.value to fund Multisig
    @param authority Second multisig Authority. Usually this is the Exchange.
    @param unlockTime Lock Ether until unlockTime in seconds.
    @return msigId Unique (owner, authority, balance != 0) multisig identifier
    */
    function initialiseMultisig(address authority, uint unlockTime)
        public
        payable
        returns (bytes32 msigId)
    {
        // Require not own authority and non-zero ether amount are sent
        require(msg.sender != authority);
        require(msg.value > 0);
        // Create unique multisig identifier
        msigId = keccak256(
            msg.sender,
            authority,
            msg.value,
            unlockTime
        );
        emit MultisigInitialised(msigId);
        // Create multisig
        Multisig storage multisig = multisigs[msigId];
        if (multisig.deposit == 0) { // New or empty multisig
            // Create new multisig
            multisig.owner = msg.sender;
            multisig.authority = authority;
        }
        // Adjust balance and locktime
        reparametrizeMultisig(msigId, unlockTime);
    }
}