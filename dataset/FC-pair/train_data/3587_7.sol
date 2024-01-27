contract c3587{
    // Note no default constructor is required, but 
    // remember to set commission wallet before operating.
    /**
     * Set crowdsale commission wallet.
     *
     * @param _newWallet New commission wallet
     */
    function setCommissionWallet(
        address _newWallet
    )
        onlyOwner
        nonZeroAddress(_newWallet)
        external
    {
        emit CommissionWalletUpdated(commissionWallet, _newWallet);
        commissionWallet = _newWallet;
    }
}