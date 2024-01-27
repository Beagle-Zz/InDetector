contract c16470{
    //returns notes placed by sender
    function getPlacedNotes() external view returns (uint[], uint[]) {
        uint length = ownedNotes[msg.sender].length;
        uint[] memory pitches = new uint[](length);
        uint[] memory places = new uint[](length);
        for (uint i = 0; i < ownedNotes[msg.sender].length; i++) {
            pitches[i] = ownedNotes[msg.sender][i].pitch;
            places[i] = ownedNotes[msg.sender][i].place;
        }
        return (pitches, places);
    }
}