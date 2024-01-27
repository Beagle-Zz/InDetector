contract c12709{
  //method for buying an ad on the market. Has to change owner only
  //set the forSale bool false again
  function marketBuy(uint _idx) public payable {
    //get add with index from parameter
    Ad storage ad = ads[_idx];
    //set restrictions
    require(msg.sender != ad.owner);
    require(msg.value > 0);
    require(msg.value >= ad.marketPrice);
    require(ad.forSale == true);
    receiver = ad.owner;
    ad.owner = msg.sender;
    ad.forSale = false;
    //set the ad back to its original price
    uint price = ad.width * ad.height * pixelPrice;
    receiver.transfer(msg.value);
    emit MarketBuy(_idx, ad.owner, ad.forSale, price);
  }
}