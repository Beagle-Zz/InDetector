contract c2727{
    // Administrative function to change the Zethr bankroll contract, should the need arise.
    function changeBankroll(address _newBankroll) public onlyOwner {
        bankroll = _newBankroll;
    }
}