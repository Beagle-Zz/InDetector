contract c18235{
    // Allocate pot #2 divs for the day (12:00 cron job)
    function snapshotDailyGooDepositFunding() external {
        require(msg.sender == owner);
        uint256 todaysGooDepositFund = (totalEtherGooResearchPool * gooDepositDivPercent) / 100; // 2% of pool daily
        totalEtherGooResearchPool -= todaysGooDepositFund;
        totalGooDepositSnapshots.push(0); // Reset for to store next day's deposits
        allocatedGooDepositSnapshots.push(todaysGooDepositFund); // Store to payout divs for previous day deposits
    }
}