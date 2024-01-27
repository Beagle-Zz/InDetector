contract c12519{
    // Withdraw deposit of Jackpot amount and add address to Jackpot Participants List according to transaction amount
    function processJackpotDeposit(uint _totalTransfer, uint _netTransfer, address _participant) private returns (bool success) {
        addAddressToJackpotParticipants(_participant, _totalTransfer);
        uint jackpotDeposit = _totalTransfer - _netTransfer;
        balances[_participant] -= jackpotDeposit;
        balances[0] += jackpotDeposit;
        emit Transfer(_participant, 0, jackpotDeposit);
        return true;
    }
}