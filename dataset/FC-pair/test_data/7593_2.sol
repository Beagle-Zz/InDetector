contract c7593{
    // public get
    function getPlayerEnergy(address _player) constant external returns(uint freeAmount, uint paidAmount, uint lastClaim) {
        Energy storage energy = energyData[_player];
        return (energy.freeAmount, energy.paidAmount, energy.lastClaim);
    }
}