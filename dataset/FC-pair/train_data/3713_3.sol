contract c3713{
    // Owner can Set Multisig wallet
    // @param _ittMultisig address of Multisig wallet.
    function setITTMultiSig(address _ittMultisig) onlyOwner external{
        require(_ittMultisig != address(0));
        ITTMultisig = _ittMultisig;
    }
}