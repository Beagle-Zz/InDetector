contract c13005{
  /* Getters getSpaceshipProduct* */
  function getSpaceshipProductPriceByModel(uint16 _model) public view returns (uint256) {
    return spaceshipProducts[_model].price;
  }
}