contract c9855{
    /**
     * @dev This method is for editing your personal note!
     * @param note - the note you want the old one to be replaced by
     * @param token_id - just token id
     */
  function _editPersonalNote(string note, uint token_id) public onlyOwnerOf(token_id) hasKT(token_id){
    KT storage currKT = KTs[token_id];
    currKT.personalNote = note;
    emit UpdateNote(note, token_id);
  }
}