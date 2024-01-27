contract c16407{
    /**
    * @dev buy Chibis with Founders
    */
    function buyChibiWithFcf(string _name, string _battleRoar, uint8 _region, uint _seed) public returns (bool success) {
        // must own at least 1 FCF, only entire FCF can be swapped for Chibis
        require(fcfContract.balanceOf(msg.sender) >= 1 * 10 ** 18);
        require(fcfPaused == false);
        // prevent hack
        uint fcfBefore = fcfContract.balanceOf(address(this));
        // user must approved Founders contract to take tokens from account
        // oh my, this will need a tutorial video
        // always only take 1 Founder at a time
        if (fcfContract.transferFrom(msg.sender, this, 1 * 10 ** 18)) {
            _mint(_name, _battleRoar, _region, _seed, true, 0);
        }
        // prevent hacking
        assert(fcfBefore == fcfContract.balanceOf(address(this)) - 1 * 10 ** 18);
        return true;
    }
}