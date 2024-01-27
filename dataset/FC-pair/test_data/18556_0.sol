contract c18556{
///////////////////
// ERC20 Methods
///////////////////
    function transfer(address _to, uint256 _amount) public returns (bool success) {
        require(transfersEnabled);
        if (address(msg.sender) == frozenReserveTeamWallet) {
            require(block.number > unfreezeTeamWalletBlock);
        }
        doTransfer(msg.sender, _to, _amount);
        return true;
    }
}