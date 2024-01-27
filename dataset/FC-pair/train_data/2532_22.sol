contract c2532{
    /**
     *  acceptPayment accept payment from PaymentAcceptor, forwards it to merchant's wallet
     *      and collects Monetha fee.
     *  @param _merchantWallet address of merchant's wallet for fund transfer
     *  @param _monethaFee is a fee collected by Monetha
     */
    function acceptPayment(address _merchantWallet, uint _monethaFee) external payable onlyMonetha whenNotPaused {
        require(_merchantWallet != 0x0);
        require(_monethaFee >= 0 && _monethaFee <= FEE_PERMILLE.mul(msg.value).div(1000)); // Monetha fee cannot be greater than 1.5% of payment
        uint merchantIncome = msg.value.sub(_monethaFee);
        _merchantWallet.transfer(merchantIncome);
        monethaVault.transfer(_monethaFee);
        PaymentProcessed(_merchantWallet, merchantIncome, _monethaFee);
    }
}