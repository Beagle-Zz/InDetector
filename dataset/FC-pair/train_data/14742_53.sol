contract c14742{
    ///@notice If champ is for sale then cancel sale
    modifier ifChampForSaleThenCancelSale(uint256 _champID){
      Champ storage champ = champs[_champID];
      if(champ.forSale){
          _cancelChampSale(champ);
      }
      _;
    }
}