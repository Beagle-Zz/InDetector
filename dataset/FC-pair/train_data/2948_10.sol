contract c2948{
    //=== Audits and Rewards
    function createAudit(uint _stake, uint _endTimeInDays, uint _maxAuditors) external payable onlyOwner {
        uint endTime = _endTimeInDays * 1 days;
        require(endTime < maxAuditDuration);
        require(block.timestamp + endTime * 1 days > block.timestamp);
        require(msg.value > 0 && _maxAuditors > 0 && _stake > 0);
        Audit memory audit;
        audit.status = AuditStatus.New;
        audit.owner = msg.sender;
        audit.id = audits.length;
        audit.totalReward = msg.value;
        audit.remainingReward = audit.totalReward;
        audit.stake = _stake;
        audit.endTime = block.timestamp + endTime;
        audit.maxAuditors = _maxAuditors;
        audits.push(audit); // push into storage
        emit CreatedAudit(audit.id);
    }
}