contract c7525{
    // all call_func from msg.sender must at least have 50 ptc coins
    modifier only_ptc_owner {
        require(ptc_ins.balanceOf(msg.sender) >= tickets);
        _;
    }
}