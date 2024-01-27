contract c2695{
     // Add address to Contributors2
     function addtoContributos2(address _address, uint _transferPercent, uint _transferPercentTotal) public onlyOwner {
        addOfContributors2[_address] = true;
        emit EventContributors2(_address, true);
        lockupHolderMap[_address] = LockupHolderDetails({
                transferPercent: _transferPercent,
                transferDays: 1,
                transferPercentTotal: _transferPercentTotal,
                transferDaysTotal: 365,
                transferLastTransaction: 0,
                transferTotalSpent: 0,
                transferPostDate: now,
                reset: true
                });
     }
}