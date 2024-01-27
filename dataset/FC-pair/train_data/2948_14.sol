contract c2948{
    // return a list of auditors that participated in this audit
    function getAuditors(uint _id) public view returns(address[]) {
        return audits[_id].participants;
    }
}