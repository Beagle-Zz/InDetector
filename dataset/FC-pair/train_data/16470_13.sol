contract c16470{
    //returns note owner
    function getNoteOwner(uint _pitch, uint _place) external view returns (address) {
        return composers[_pitch][_place];
    }
}