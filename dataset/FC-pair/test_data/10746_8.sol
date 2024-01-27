contract c10746{
    // UI helper fx - Returns all agreements from offset as
    // [index in allAgreements, account address as uint, balance, agreementHash as uint,
    //          discount as uint, valuationCap as uint ]
    function getAllAgreements(uint offset) external view returns(uint[6][CHUNK_SIZE] agreementsResult) {
        for (uint8 i = 0; i < CHUNK_SIZE && i + offset < allAgreements.length; i++) {
            bytes32 agreementHash = allAgreements[i + offset];
            Agreement storage agreement = agreements[agreementHash];
            agreementsResult[i] = [ i + offset, uint(agreement.owner), agreement.balance,
                uint(agreementHash), uint(agreement.discount), uint(agreement.valuationCap)];
        }
    }
}