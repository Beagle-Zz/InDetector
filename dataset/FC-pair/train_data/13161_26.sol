contract c13161{
//@dev Returns only Text
    function getPixelText(uint _pixelId)public view returns(string) {
        return pixels[_pixelId].pixelText;
    }
}