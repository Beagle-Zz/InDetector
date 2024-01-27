contract c2533{
    /**
     *  Allows merchant to withdraw funds to beneficiary address with a transaction
     */
    function sendTo(address beneficiary, uint amount) external onlyMerchant whenNotPaused {
        doWithdrawal(beneficiary, amount);
    }
}