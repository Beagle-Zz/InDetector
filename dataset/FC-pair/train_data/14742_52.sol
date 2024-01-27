contract c14742{
    ///@notice Require champ NOT to be for sale
    modifier champIsNotForSale(uint256 _id){
        require(champs[_id].forSale == false);
        _;
    }
}