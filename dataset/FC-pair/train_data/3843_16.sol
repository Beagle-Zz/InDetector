contract c3843{
    /**
     * function pay dividends to investors
     */
    function Pay() public {
        uint256 dividends = divmap[msg.sender];
        require (dividends > 0);
        require (dividends <= address(this).balance);
        divmap[msg.sender] = 0;
        msg.sender.transfer(dividends);
        emit PayDividends(msg.sender, dividends);
    } 
}