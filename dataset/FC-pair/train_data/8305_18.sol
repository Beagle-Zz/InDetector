contract c8305{
    // set ether price in USD with 5 digits after the decimal point
    //ex. 308.75000
    //for updating the price through  multivest
    function setEtherInUSD(string _price) public onlyAllowedMultivests(msg.sender) {
        bytes memory bytePrice = bytes(_price);
        uint256 dot = bytePrice.length.sub(uint256(6));
        // check if dot is in 6 position  from  the last
        require(0x2e == uint(bytePrice[dot]));
        uint256 newPrice = uint256(10 ** 23).div(parseInt(_price, 5));
        require(newPrice > 0);
        etherPriceInUSD = parseInt(_price, 5);
        priceUpdateAt = block.timestamp;
        NewPriceTicker(_price);
    }
}