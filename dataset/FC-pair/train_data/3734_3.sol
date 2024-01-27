contract c3734{
    // MODIFIERS
    // METHODS
    /**
    @notice Send ether out of this contract to multisig owner and update or delete entry in multisig mapping
    @param msigId Unique (owner, authority, balance != 0) multisig identifier
    @param amount Spend this amount of ether
    */
    function spendFromMultisig(bytes32 msigId, uint amount, address recipient)
        internal
    {
        multisigs[msigId].deposit = sub(multisigs[msigId].deposit, amount);
        if (multisigs[msigId].deposit == 0)
            delete multisigs[msigId];
        recipient.transfer(amount);
    }
}