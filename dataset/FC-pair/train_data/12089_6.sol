contract c12089{
    // cell has valid fish or bonus
    function findTargetCell(uint _fromPos, uint _toPos) constant public returns(uint pos, uint fishId, address player, uint weight) {
        for (uint index = _fromPos; index <= _toPos; index+=1) {
            if (ocean[index] > 0) {
                fishId = ocean[index];
                Fish storage fish = fishMap[fishId];
                return (index, fishId, fish.player, fish.weight);
            }
            if (bonus[index] > 0) {
                return (index, 0, address(0), bonus[index]);
            }
        }
    }
}