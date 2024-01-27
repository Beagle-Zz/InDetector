contract c12089{
    // public get 
    function getFish(uint32 _fishId) constant public returns(address player, uint weight, bool active) {
        Fish storage fish = fishMap[_fishId];
        return (fish.player, fish.weight, fish.active);
    }
}