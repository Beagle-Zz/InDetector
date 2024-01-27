contract c13161{
////////////////////
///Private functions
////////////////////
//@dev create a pixel
    function _createPixel (uint32 _id, uint8 _colourR, uint8 _colourG, uint8 _colourB, string _pixelText) private returns(uint) {
        pixels[_id] = Pixel(_id, _colourR, _colourG, _colourB, _pixelText);
        pixelToPrice[_id] = startingPrice;
        emit ColourChanged(_id, _colourR, _colourG, _colourB);
        return _id;
    }
}