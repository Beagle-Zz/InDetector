contract c7487{
///////////////////////////
// SecurityGuard Interface
///////////////////////////
    /**
    * @notice `onlySecurityGuard` can checkin. If they fail to checkin,
    * payments will not be allowed to be disbursed, unless the payment has
    * an `earliestPayTime` <= `securityGuardLastCheckin`.
    * @notice To reduce the risk of a front-running attack on payments, it
    * is important that this is called with a resonable gasPrice set for the
    * current network congestion. If this tx is not mined, within 30 mins
    * of being sent, it is possible that a payment can be authorized w/o the
    * securityGuard's knowledge
    */
    function checkIn() onlySecurityGuard external {
        securityGuardLastCheckin = _getTime();
    }
}