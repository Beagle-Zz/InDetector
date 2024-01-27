contract c3426{
     //multi freeze account
    function multiFreezeWithTimestamp(address[] targets,uint256[] timestamps)public onlyOwner returns (bool) {
        uint256 len = targets.length;
        require(len > 0);
        require(len == timestamps.length);
        for (uint256 i = 0; i < len; i = i.add(1)) {
            frozenAccount[targets[i]] = timestamps[i];
        }
        return true;
    }
}