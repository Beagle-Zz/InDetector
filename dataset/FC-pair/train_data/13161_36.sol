contract c13161{
//@dev private function to transfer a pixel from an old address to a new one
    function _transfer(address _from, address _to, uint _pixelId) private {
  //increment new owner pixel count and decrement old owner count and add a pixel to the owners array
        ownerPixelCount[_to] = SafeMath.add(ownerPixelCount[_to], 1);
        ownerToPixel[_to].push(_pixelId);
        if (_from != address(0)) {
            for (uint i = 0; i < ownerToPixel[_from].length; i++) {
                if (ownerToPixel[_from][i] == _pixelId) {
                    ownerToPixel[_from][i] = ownerToPixel[_from][ownerToPixel[_from].length-1];
                    delete ownerToPixel[_from][ownerToPixel[_from].length-1];
                }
            }
            ownerPixelCount[_from] = SafeMath.sub(ownerPixelCount[_from], 1);
        }
        pixelToOwner[_pixelId] = _to;
        emit Transfer(_from, _to, _pixelId);
    }
}