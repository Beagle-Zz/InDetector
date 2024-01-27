contract c11994{
    // ETH handler
    function BuyPresalePackage(uint8 packageId, address referral) external payable
    {
        require(isActive);
        require(packageId < presalePackLimit.length);
        require(msg.sender != referral);
        require(presalePackLimit[packageId] > presalePackSold[packageId]);
        require(presaleTokenContract != RigCraftPresalePackageToken(address(0)));
        // check money
        require(msg.value >= presalePackagePrice[packageId]);
        presalePackSold[packageId]++;
        totalFundsSoFar += msg.value;
        presaleTokenContract.CreateToken(msg.sender, packageId, presalePackSold[packageId]);
        if(referral != address(0))
        {
            if(addressRefferedCount[referral] == 0)
            {
                referralAddressIndex.length += 1;
                referralAddressIndex[referralAddressIndex.length-1] = referral;
            }
            addressRefferedCount[referral] += 1;
            addressRefferredSpending[referral] += msg.value;
        }
    }
}