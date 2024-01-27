contract c16470{
    //gets a line in the composition for viewing purposes and to prevent having to get the whole composition at once
    function getNoteLine(uint _pitch) external view returns (bool[1000], address[1000]) {
        bool[1000] memory _pitches = composition[_pitch];
        address[1000] memory _composers = composers[_pitch];
        return (_pitches, _composers);
    }
}