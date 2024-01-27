contract c10682{
    /**
     * User exchange for team cup
     */
    function exchange() public {
        require(msg.sender != address(0x0));
        require(msg.sender != address(this));
        require(!halting);
        // collect cup token
        uint256 allowance = cup.allowance(msg.sender, this);
        require(allowance > 0);
        require(cup.transferFrom(msg.sender, this, allowance));
        // transfer team cup token
        uint256 teamCupBalance = teamCup.balanceOf(address(this));
        uint256 teamCupAmount = allowance * exchangePrice;
        require(teamCupAmount <= teamCupBalance);
        require(teamCup.transfer(msg.sender, teamCupAmount));
        emit Exchange(msg.sender, teamCupAmount, allowance);
    }
}