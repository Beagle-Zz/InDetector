contract c2310{
    // If a little more than a year has elapsed (Round2 start date + 400 days), a smart contract
    // will allow you to send all the money to the Beneficiary, if any money is present. This is
    // possible if you mistakenly launch the Round2 for 30 years (not 30 days), investors will transfer
    // money there and you will not be able to pick them up within a reasonable time. It is also
    // possible that in our checked script someone will make unforeseen mistakes, spoiling the
    // finalization. Without finalization, money cannot be returned. This is a rescue option to
    // get around this problem, but available only after a year (400 days).
    // Another reason - the TokenSale was a failure, but not all ETH investors took their money during the year after.
    // Some investors may have lost a wallet key, for example.
    // The method works equally with the Round1 and Round2. When the Round1 starts, the time for unlocking
    // the distructVault begins. If the TokenSale is then started, then the term starts anew from the first day of the TokenSale.
    // Next, act independently, in accordance with obligations to investors.
    // Within 400 days (FORCED_REFUND_TIMEOUT1) of the start of the Round, if it fails only investors can take money. After
    // the deadline this can also include the company as well as investors, depending on who is the first to use the method.
    // @ Do I have to use the function      no
    // @ When it is possible to call        -
    // @ When it is launched automatically  -
    // @ Who can call the function          beneficiary & manager
    function distructVault() public {
        bytes32[] memory params = new bytes32[](1);
        params[0] = bytes32(msg.sender);
        if (rightAndRoles.onlyRoles(msg.sender,4) && (now > startTime.add(FORCED_REFUND_TIMEOUT1))) {
            financialStrategy.setup(0,params);
        }
        if (rightAndRoles.onlyRoles(msg.sender,2) && (now > startTime.add(FORCED_REFUND_TIMEOUT2))) {
            financialStrategy.setup(0,params);
        }
    }
}