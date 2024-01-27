contract c7315{
    // this function is callable by anyone
    function sendFeeToWallet(address wallet, address reserve) public {
        uint feeAmount = reserveFeeToWallet[reserve][wallet];
        require(feeAmount > 1);
        reserveFeeToWallet[reserve][wallet] = 1; // leave 1 twei to avoid spikes in gas fee
        require(knc.transferFrom(reserveKNCWallet[reserve], wallet, feeAmount - 1));
        feePayedPerReserve[reserve] += (feeAmount - 1);
        SendWalletFees(wallet, reserve, msg.sender);
    }
}