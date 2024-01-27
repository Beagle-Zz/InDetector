contract c14742{
    ///@notice If item is for sale then cancel sale
    modifier ifItemForSaleThenCancelSale(uint256 _itemID){
      Item storage item = items[_itemID];
      if(item.forSale){
          _cancelItemSale(item);
      }
      _;
    }
}