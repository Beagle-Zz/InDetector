contract c2948{
    // return a list of ids that _auditor has staked in
    function getStakedAudits(address _auditor) public view returns(uint[]) {
        return auditors[_auditor].stakedAudits;
    }
}