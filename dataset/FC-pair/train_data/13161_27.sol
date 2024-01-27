contract c13161{
//@dev Returns the priceof a pixel
    function getPixelPrice(uint _pixelId) public view returns(uint) {
        uint price = pixelToPrice[_pixelId];
        if (price != 0) {
            return price;
        } else {
            return startingPrice;
            }
    } 
}