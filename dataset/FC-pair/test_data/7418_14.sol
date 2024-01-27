contract c7418{
    // dividend payout section
    // when user wants to claim for dividend, they should press this function
    // which will freeze their account temporarily after diviendend payout is
    // complete
    function claimfordividend() public {
        freezeAccount(msg.sender , true);
    }
}