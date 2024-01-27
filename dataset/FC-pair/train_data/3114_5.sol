contract c3114{
    /**
    * @dev Releases Jiffys that have been vested for an account
    *
    * @param account Account whose Jiffys will be released
    *
    */ 
    function releaseFor
                            (
                                address account
                            ) 
                            public 
                            requireIsOperational 
    {
        require(account != address(0));
        require(vestingGrants[account].isGranted);
        require(vestingGrants[account].cliffTimestamp <= now);
        // Calculate vesting rate per second        
        uint256 jiffysPerSecond = (vestingGrants[account].grantJiffys.div(vestingGrants[account].endTimestamp.sub(vestingGrants[account].startTimestamp)));
        // Calculate how many jiffys can be released
        uint256 releasableJiffys = now.sub(vestingGrants[account].startTimestamp).mul(jiffysPerSecond).sub(vestingGrants[account].releasedJiffys);
        // If the additional released Jiffys would cause the total released to exceed total granted, then
        // cap the releasable Jiffys to whatever was granted.
        if ((vestingGrants[account].releasedJiffys.add(releasableJiffys)) > vestingGrants[account].grantJiffys) {
            releasableJiffys = vestingGrants[account].grantJiffys.sub(vestingGrants[account].releasedJiffys);
        }
        if (releasableJiffys > 0) {
            // Update the released Jiffys counter
            vestingGrants[account].releasedJiffys = vestingGrants[account].releasedJiffys.add(releasableJiffys);
            whenContract.vestingTransfer(vestingGrants[account].issuer, account, releasableJiffys);
        }
    }
}