contract c12656{
    // return the price as number of tokens released for each ether
    function price() public view returns(uint){
      // determine which discount to apply
      if (now < roundTwoTime) {
          return(TOKEN_FIRST_PRICE_RATE);
      } else if (now < roundThreeTime){
          return (TOKEN_SECOND_PRICE_RATE);
      } else if (now < roundFourTime) {
          return (TOKEN_THIRD_PRICE_RATE);
      }else if (now < roundFiveTime) {
          return (TOKEN_FOURTH_PRICE_RATE);
      } else {
          return (TOKEN_FIFTH_PRICE_RATE);
      }
    }
}