contract c4759{
    // can only set limits once
    function setLimit(uint16 id, uint64 limit) public onlyGovernor {
        Limit memory l = limits[id];
        require(!l.exists);
        limits[id] = Limit({
            limit: limit,
            exists: true
        });
    }
}