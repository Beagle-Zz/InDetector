contract c7149{
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //
    // When ICO is closed, send the relaining (unsold) tokens to address 0x0
    // So no one will be able to use it anymore... 
    // Anyone can check address 0x0, so to proove unsold tokens belong to no one anymore
    //
    //--------------------------------------------------------------------------
    function destroyRemainingTokens() public unlocked /*view*/ returns(uint)
    {
        require(msg.sender==allowedSender && now>lockedUntil);
        address   toAddr = 0x0000000000000000000000000000000000000000;
        uint256   amountToBurn = balances[allowedSender];
        if (amountToBurn > icoReserveSupply)
        {
            amountToBurn = amountToBurn.sub(icoReserveSupply);
        }
        balances[owner]  = balances[allowedSender].sub(amountToBurn);
        balances[toAddr] = balances[toAddr].add(amountToBurn);
        //emit Transfer(msg.sender, toAddr, amount);
        Transfer(msg.sender, toAddr, amountToBurn);
        return 1;
    }        
}