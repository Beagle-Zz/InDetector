contract c12709{
  //payable function to trigger the purchase
  function buy(uint _x, uint _y, uint _width, uint _height, string _title, string _link, string _ipfsHash) public payable returns (uint idx) {
    //calculate the price of the ad
    uint price = _width * _height * pixelPrice;
    //set restrictions
    require(price > 0);
    require(msg.value >= price);
    require(_width % 25 == 0);
    require(_height % 25 == 0);
    //fill 2d array with true fo the purchased blocks
    //if the block is already true (means its already bought)
    // -> revert()
    for(uint i = 0; i < _width / 25; i++) {
        for(uint j = 0; j < _height / 25; j++) {
            if (grid[_x / 25 + i][_y / 25 + j]) {
                revert();
            }
            grid[_x / 25 + i][_y / 25 + j] = true;
        }
    }
    //store the ad, return the index
    Ad memory ad = Ad(msg.sender, _x, _y, _width, _height, _title, _link, _ipfsHash, false, true, price);
    idx = ads.push(ad) - 1;
    //trigger transaction with the buy event
    emit Buy(idx, msg.sender, _x, _y, _width, _height);
    return idx;
  }
}