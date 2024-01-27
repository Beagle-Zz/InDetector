contract c16470{
    //removes up to 10 owned notes from composition
    function removeNotes(uint256[] _pitches, uint256[] _places, uint256 _numNotes) beforeEndTime() removeValidNotes(_pitches, _places, _numNotes) external {
        for (uint256 i = 0; i < _pitches.length; i++) {
            uint256 pitch = _pitches[i];
            uint256 place = _places[i];
            composition[pitch][place] = false;
            composers[pitch][place] = 0x0;
            removeOwnedNote(msg.sender, pitch, place);
            emit NoteRemoved(msg.sender, pitch, place);
        }
        require(notes.transfer(msg.sender, _numNotes));
    }
}