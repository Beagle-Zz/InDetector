contract c12709{
  //function for setting an ad active or inactive
  function setActive(uint _idx, bool _active) public onlyContractOwner {
    //get add with index from parameter
    Ad storage ad = ads[_idx];
    ad.active = _active;
    emit SetActive(_idx, ad.active);
  }
}