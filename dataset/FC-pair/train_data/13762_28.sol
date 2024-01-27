contract c13762{
    /// @dev cfo withdraw dead ether. 
    function withdrawDeadFund( address addr) external onlyCFO {
        uint fund = balances[addr];
        require (fund > 0);
        delete balances[addr];
        cfoAddress.transfer(fund);
    }
}