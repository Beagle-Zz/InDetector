contract c11243{
    // cell has valid fish or bonus
    function getActiveFish(uint _fromPos, uint _toPos) constant public returns(uint pos, uint fishId, address player, uint weight, uint blockNumber) {
        for (uint index = _fromPos; index <= _toPos; index+=1) {
            if (ocean[index] > 0) {
                fishId = ocean[index];
                Fish storage fish = fishMap[fishId];
                return (index, fishId, fish.player, fish.weight, fish.blockNumber);
            }
        }
    }
}