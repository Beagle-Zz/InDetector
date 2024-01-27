contract c13837{
    // Add modifier of onlyCOO
    function createEggScheme( uint256 _eggId, uint256 _stock, uint256 _maxAllowedToBuy, uint256 _customGene, uint256 _price, uint256 _increase, bool _active, bool _open ) public onlyCEO returns (bool){
        require(!eggExists(_eggId));
        eggs[_eggId].isEggScheme = true;
        eggs[_eggId].id = _eggId;
        eggs[_eggId].stock = _stock;
        eggs[_eggId].maxAllowedToBuy = _maxAllowedToBuy;
        eggs[_eggId].purchased = 0;
        eggs[_eggId].customGene = _customGene;
        eggs[_eggId].price = _price;
        eggs[_eggId].increase = _increase;
        setActiveStatusEgg(_eggId,_active);
        setOpenStatusEgg(_eggId,_open);
        eggsIndexes.push(_eggId);
        return true;
    }
}