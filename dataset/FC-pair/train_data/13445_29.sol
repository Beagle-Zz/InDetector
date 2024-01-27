contract c13445{
    // Sell all cookies, the eth earned is calculated by the proportion of cookies owned.
    // Selling of cookie is forbidden within one hour of new production unit launch.
    function sellAllCookies() public {
        updatePlayersCookie(msg.sender);
        uint256 sellPrice = computeSellPrice();
        require(sellPrice > 0);
        uint256 myCookies = cookieBalance[msg.sender];
        uint256 value = myCookies * sellPrice / (1 ether);
        cookieBalance[msg.sender] = 0;
        msg.sender.transfer(value);
    }
}