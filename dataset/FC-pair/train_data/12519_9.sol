contract c12519{
    // Using this function a user transfers tokens and participates in operating jackpot 
    // User sets the total transfer amount that includes the Jackpot reserving deposit
    function transferWithReserving(address _to, uint _totalTransfer) public returns (bool success) {
        uint netTransfer = _totalTransfer * (10000 - reservingPercentage) / 10000; 
        require(balances[msg.sender] >= _totalTransfer && (_totalTransfer > netTransfer));
        if (transferMain(msg.sender, _to, netTransfer) && (_totalTransfer >= reservingStep)) {
            processJackpotDeposit(_totalTransfer, netTransfer, msg.sender);
        }
        return true;
    }
}