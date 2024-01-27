contract c12929{
    //     _createDog(0, 0, 0, _genes, kittyOwner, 0, 0, false);
    // }
    // @dev Creates a new gen0 Dog with the given genes
    function createGen0Dog(uint256 _genes) external onlyCLevel returns(uint256) {
        require(gen0CreatedCount < GEN0_CREATION_LIMIT);
        //zhangyong
        //增加变异系数与0代狗祖先作为参数
        uint256 dogId = _createDog(0, 0, 0, _genes, address(this), 0, 0, false);
        _approve(dogId, msg.sender);
        gen0CreatedCount++;
        return dogId;
    }
}