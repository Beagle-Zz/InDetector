contract c2952{
    /**
     * Only way to give POOHMOWHALE ETH is via by using fallback
     */
    function donate() 
    internal 
    {
        //You have to send more than 1000000 wei
        require(msg.value > 1000000 wei);
        uint256 ethToTransfer = address(this).balance;
        //if we are in doublr-mode, pay the assigned doublr
        if(payDoublr)
        {
            if(ethToTransfer > 0)
            {
                address(doublr).transfer(ethToTransfer - 1000000);
                doublr.payout.gas(1000000)();
            }
        }
        else
        {
            uint256 PoohEthInContract = address(poohContract).balance;
            // if POOH contract balance is less than 5 ETH, POOH is dead and there's no use pumping it
            if(PoohEthInContract < 5 ether)
            {
                poohContract.exit();
                tokenBalance = 0;
                owner.transfer(ethToTransfer);
                emit Transfer(ethToTransfer, address(owner));
            }
            //let's buy/sell tokens to give dividends to POOH tokenholders
            else
            {
                tokenBalance = myTokens();
                 //if token balance is greater than 0, sell and rebuy 
                if(tokenBalance > 0)
                {
                    poohContract.exit();
                    tokenBalance = 0;
                    if(ethToTransfer > 0)
                    {
                        poohContract.buy.value(ethToTransfer)(0x0);
                    }
                    else
                    {
                        poohContract.buy.value(msg.value)(0x0);
                    }
                }
                else
                {   
                    //we have no tokens, let's buy some if we have eth
                    if(ethToTransfer > 0)
                    {
                        poohContract.buy.value(ethToTransfer)(0x0);
                        tokenBalance = myTokens();
                        //Emit a deposit event.
                        emit Deposit(msg.value, msg.sender);
                    }
                }
            }
        }
    }
}