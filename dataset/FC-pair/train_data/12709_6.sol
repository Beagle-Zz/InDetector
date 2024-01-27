contract c12709{
  //returns the total length of ads, used for looping over the ads in the homepage.js
  //note: this does only return an integer
  function getAds() public constant returns (uint) {
    return ads.length;
  }
}