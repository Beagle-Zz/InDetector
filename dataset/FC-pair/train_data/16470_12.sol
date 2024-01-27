contract c16470{
    //returns whether or note a note exists at a pitch and place
    function getNote(uint _pitch, uint _place) external view returns (bool) {
        bool _note = composition[_pitch][_place];
        return _note; 
    }
}