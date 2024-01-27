contract c2695{
     // Add address to Tech & Operation
     function addtoTechOperation(address _address, uint _transferPercent, uint _transferPercentTotal) public onlyOwner {
        addOfTechOperation[_address] = true;
        emit EventTechOperation(_address, true);
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