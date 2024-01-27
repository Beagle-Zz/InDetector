contract c14545{
    //--------------------------------------------------------------------------
    // ETH handler functions
    //--------------------------------------------------------------------------
    function BuyHandler(uint amount) private
    {
        // add 90% to honeyPot
        honeyPotAmount += (amount * honeyPotSharePct) / 100;
        jackPot += amount / 100;
        devFund += (amount * (100-(honeyPotSharePct+1))) / 100;
    }
}