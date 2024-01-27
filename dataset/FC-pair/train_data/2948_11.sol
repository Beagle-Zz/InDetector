contract c2948{
    //=== User Actions
    function stake(uint _id) public payable {
        // Check conditions of the Audit
        require(msg.value == audits[_id].stake);
        require(block.timestamp < audits[_id].endTime);
        require(audits[_id].participants.length < audits[_id].maxAuditors);
        require(audits[_id].status == AuditStatus.New || audits[_id].status == AuditStatus.InProgress);
        // Check conditions of the Auditor
        require(auditors[msg.sender].addr == msg.sender && !auditors[msg.sender].banned); // auditor is authorized
        require(!auditors[msg.sender].stakedInAudit[_id]); //check if auditor has staked for this audit already
        // Update audit's states
        audits[_id].status = AuditStatus.InProgress;
        audits[_id].participants.push(msg.sender);
        // Update auditor's states
        auditors[msg.sender].stakedInAudit[_id] = true;
        auditors[msg.sender].stakedAudits.push(_id);
        emit AuditorStaked(_id, msg.sender, msg.value);
    }
}