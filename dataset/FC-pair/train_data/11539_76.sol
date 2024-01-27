contract c11539{
    /// @notice This function will allow token withdraw from locker.
    /// 25% of total deposited tokens can be withdrawn after initial auction end.
    /// Remaining 75% can be withdrawn in equal amount over 12 quarters.
    function withdraw() public onlyOwner postLock {
        require(deposited > 0);
        uint withdrawable = 0; 
        uint withdrawTime = auctions.initialAuctionEndTime();
        if (lastWithdrawTime == 0 && auctions.isInitialAuctionEnded()) {
            withdrawable = withdrawable.add((deposited.mul(25)).div(100));
            quarterlyWithdrawable = (deposited.sub(withdrawable)).div(12);
            lastWithdrawTime = withdrawTime;
        }
        require(lastWithdrawTime != 0);
        if (now >= lastWithdrawTime.add(QUARTER)) {
            uint daysSinceLastWithdraw = now.sub(lastWithdrawTime);
            uint totalQuarters = daysSinceLastWithdraw.div(QUARTER);
            require(totalQuarters > 0);
            withdrawable = withdrawable.add(quarterlyWithdrawable.mul(totalQuarters));
            if (now >= withdrawTime.add(QUARTER.mul(12))) {
                withdrawable = deposited;
            }
            lastWithdrawTime = lastWithdrawTime.add(totalQuarters.mul(QUARTER));
        }
        if (withdrawable > 0) {
            deposited = deposited.sub(withdrawable);
            token.transfer(msg.sender, withdrawable);
            emit Withdrawn(msg.sender, withdrawable);
        }
    }
}