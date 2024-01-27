contract c3419{
    // NON-CONSTANT METHODS
    /// @notice Register to take part in the competition
    /// @dev Check if the fund address is actually from the Competition Version
    /// @param fund Address of the Melon fund
    /// @param v ellipitc curve parameter v
    /// @param r ellipitc curve parameter r
    /// @param s ellipitc curve parameter s
    function registerForCompetition(
        address fund,
        uint8 v,
        bytes32 r,
        bytes32 s
    )
        payable
        pre_cond(isCompetitionActive() && !Version(COMPETITION_VERSION).isShutDown())
        pre_cond(termsAndConditionsAreSigned(msg.sender, v, r, s) && isWhitelisted(msg.sender))
    {
        require(registeredFundToRegistrants[fund] == address(0) && registrantToRegistrantIds[msg.sender].exists == false);
        require(add(currentTotalBuyin, msg.value) <= totalMaxBuyin && registrants.length < maxRegistrants);
        require(msg.value <= whitelistantToMaxBuyin[msg.sender]);
        require(Version(COMPETITION_VERSION).getFundByManager(msg.sender) == fund);
        // Calculate Payout Quantity, invest the quantity in registrant's fund
        uint payoutQuantity = calculatePayout(msg.value);
        registeredFundToRegistrants[fund] = msg.sender;
        registrantToRegistrantIds[msg.sender] = RegistrantId({id: registrants.length, exists: true});
        currentTotalBuyin = add(currentTotalBuyin, msg.value);
        FundInterface fundContract = FundInterface(fund);
        MELON_CONTRACT.approve(fund, payoutQuantity);
        // Give payoutRequest MLN in return for msg.value
        fundContract.requestInvestment(payoutQuantity, getEtherValue(payoutQuantity), MELON_ASSET);
        fundContract.executeRequest(fundContract.getLastRequestId());
        custodian.transfer(msg.value);
        // Emit Register event
        emit Register(registrants.length, fund, msg.sender);
        registrants.push(Registrant({
            fund: fund,
            registrant: msg.sender,
            hasSigned: true,
            buyinQuantity: msg.value,
            payoutQuantity: payoutQuantity,
            isRewarded: false
        }));
    }
}