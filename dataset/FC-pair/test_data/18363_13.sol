contract c18363{
    /**
     * @dev function for rewarding token holders, who didn't transfer in 1 or 2 years
     * @param _holder token holders address
     */
    function rewarding(address _holder) public onlyOwner returns(uint){
        if(notransfer[_holder]==true){
            if(now >= endTime + 63072000){
                uint noTransfer2BonusYear = balances[_holder]*25 / 100;
                if (balances[fundWallet] >= noTransfer2BonusYear) {
                    balances[fundWallet] = balances[fundWallet] - noTransfer2BonusYear;
                    balances[_holder] = balances[_holder] + noTransfer2BonusYear;
                    assert(balances[_holder] >= noTransfer2BonusYear);
                    Transfer(fundWallet, _holder, noTransfer2BonusYear);
                    notransfer[_holder]=false;
                    return noTransfer2BonusYear;
                }
            } else if (now >= endTime + 31536000) {
                uint noTransferBonusYear = balances[_holder]*15 / 100;
                if (balances[fundWallet] >= noTransferBonusYear) {
                    balances[fundWallet] = balances[fundWallet] - noTransferBonusYear;
                    balances[_holder] = balances[_holder] + noTransferBonusYear;
                    assert(balances[_holder] >= noTransferBonusYear);
                    Transfer(fundWallet, _holder, noTransferBonusYear);
                    notransfer[_holder]=false;
                    return noTransferBonusYear;
                }
            }
        }
    }
}