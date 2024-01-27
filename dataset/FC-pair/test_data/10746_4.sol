contract c10746{
    /* Restricted function to allow pretoken signers to fix incorrect issuance */
    function burnFrom(bytes32 agreementHash, uint amount)
    public restrict("PreTokenSigner") returns (bool) {
        Agreement storage agreement = agreements[agreementHash];
        require(agreement.discount > 0, "agreement must exist"); // this is redundant b/c of next requires but be explicit
        require(amount > 0, "burn amount must be > 0");
        require(agreement.balance >= amount, "must not burn more than balance"); // .sub would revert anyways but emit reason
        agreement.balance = agreement.balance.sub(amount);
        totalSupply = totalSupply.sub(amount);
        emit Transfer(agreement.owner, 0x0, amount);
        return true;
    }
}