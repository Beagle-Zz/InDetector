contract c10746{
    /* Restricted function to allow pretoken signers to fix if pretoken owner lost keys */
    function transferAgreement(bytes32 agreementHash, address to)
    public restrict("PreTokenSigner") returns (bool) {
        _transfer(agreements[agreementHash].owner, to);
        return true;
    }
}