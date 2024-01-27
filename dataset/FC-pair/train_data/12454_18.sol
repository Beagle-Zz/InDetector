contract c12454{
    // receive funds. gas limited. min contrib.
    function _receiveDeposit() isOpenContract internal {
        require(tx.gasprice <= gasLimit, "Gas too high");
        require(address(this).balance <= totalPoolCap, "Deposit will put pool over limit. Reverting.");
        // Now the code
        Beneficiary storage b = beneficiaries[msg.sender];
        uint256 newBalance = b.balance.add(msg.value);
        require(newBalance >= minContribution, "contribution is lower than minContribution");
        if(b.cap > 0){
            require(newBalance <= b.cap, "balance is less than set cap for beneficiary");
        } else if(currentBeneficiaryCap == 0) {
            // we have an open cap, no limits
            b.cap = totalPoolCap;
        }else {
            require(newBalance <= currentBeneficiaryCap, "balance is more than currentBeneficiaryCap");
            // we set it to the default cap
            b.cap = currentBeneficiaryCap;
        }
        b.balance = newBalance;
        emit BeneficiaryBalanceChanged(msg.sender, newBalance);
    }
}