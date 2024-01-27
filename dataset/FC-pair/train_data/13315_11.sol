contract c13315{
    /**
    ** @dev this method is used to calculate Parent Object's Owner Cut in the game
    ** owner of PARENT objects will get : percentWhenParent % from his Objects + any additional bonuses he may have from SPECIAL trade objects
    ** that are increasing PARENT percentage
    **/
    function returnParentObjectCut( CrySolObject storage _obj, uint256 _price ) private view returns(uint) {
        uint256 _percentWhenParent = crySolObjects[_obj.parentID].percentWhenParent + (ownerAddPercentToParent[crySolObjects[_obj.parentID].owner]).div(10);
        return _price.mul(_percentWhenParent).div(100); //_parentCut
    }
}