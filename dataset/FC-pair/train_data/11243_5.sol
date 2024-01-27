contract c11243{
    // public get 
    function getFish(uint32 _fishId) constant public returns(address player, uint weight, bool active, uint blockNumber) {
        Fish storage fish = fishMap[_fishId];
        return (fish.player, fish.weight, fish.active, fish.blockNumber);
    }
}