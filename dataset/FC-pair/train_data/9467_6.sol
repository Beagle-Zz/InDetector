contract c9467{
    /**
     * @dev The creator of KTs. Only done by Krypital.
     * @param oNote - the official, special note left only by Krypital!
     */
  function _createKT(string oNote) public onlyOLevel withinTotal {
    uint thisId = maxId + 1;
    uint256 thisGene = uint256(keccak256(oNote));
    KT memory thisKT = KT({
        officialNote: oNote, 
        personalNote: "", 
        paused: false, 
        gene: thisGene, 
        level: 1, 
        id: thisId
    });
    KTs[thisId] = thisKT;
    maxId = maxId + 1;
    curr_number = curr_number + 1;
    KTToOwner[thisId] = msg.sender;
    ownerKTCount[msg.sender]++;
    emit NewKT(oNote, thisGene, 1, thisId);
  }
}