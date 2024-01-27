contract c13762{
    /// @dev partner withdraw, 
    function userWithdraw() public {
        uint fund = balances[msg.sender];
        require (fund > 0);
        delete balances[msg.sender];
        msg.sender.transfer(fund);
    }
}