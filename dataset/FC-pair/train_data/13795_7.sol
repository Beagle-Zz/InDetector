contract c13795{
    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to `to` account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transferToTeam(address _to, uint _amount) public onlyOwner returns (bool success) {
        require(transfersEnabled);
        transferToLimited(msg.sender, _to, _amount, limitTeamType);
        return true;
    }
}