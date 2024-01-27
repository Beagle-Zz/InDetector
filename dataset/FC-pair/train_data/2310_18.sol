contract c2310{
    // Remove the "Pause of exchange". Available to the manager at any time. If the
    // manager refuses to remove the pause, then 30-120 days after the successful
    // completion of the TokenSale, anyone can remove a pause and allow the exchange to continue.
    // The manager does not interfere and will not be able to delay the term.
    // He can only cancel the pause before the appointed time.
    // @ Do I have to use the function      YES YES YES
    // @ When it is possible to call        after end of ICO
    // @ When it is launched automatically  -
    // @ Who can call the function          admins or anybody
    function tokenUnpause() external {
        require(rightAndRoles.onlyRoles(msg.sender,2)
        || (now > endTime.add(renewal).add(USER_UNPAUSE_TOKEN_TIMEOUT) && TokenSale == TokenSaleType.round2 && isFinalized && goalReached()));
        token.setPause(false);
    }
}