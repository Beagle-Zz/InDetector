contract c2532{
    /**
     *  setMerchantWallet allows owner to change address of MerchantWallet.
     *  @param _newWallet Address of new MerchantWallet contract
     */
    function setMerchantWallet(MerchantWallet _newWallet) public onlyOwner {
        require(address(_newWallet) != 0x0);
        require(_newWallet.merchantIdHash() == merchantIdHash);
        merchantWallet = _newWallet;
    }
}